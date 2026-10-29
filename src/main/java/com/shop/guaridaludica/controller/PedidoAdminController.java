package com.shop.guaridaludica.controller;

import com.shop.guaridaludica.model.Pedido;
import com.shop.guaridaludica.repository.PedidoRepository;
import com.shop.guaridaludica.repository.ProductoRepository;
import com.shop.guaridaludica.service.EmailService;
import com.shop.guaridaludica.model.DetallePedido;
import com.shop.guaridaludica.model.Producto;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;

@Controller
@RequestMapping("/admin/pedidos")
public class PedidoAdminController {
    @Autowired
    private PedidoRepository pedidoRepository;

    @Autowired
    private ProductoRepository productoRepository;

    @Autowired
    private EmailService emailService;

    // Inyectamos el mismo tamaño de paginación de administración que usas en productos
    @Value("${shop.pagination.admin-size}")
    private int adminSize;

    // Listar todos los pedidos de la tienda para el admin
    @GetMapping
    public String listarPedidosAdmin(@RequestParam(required = false) String query,
            @RequestParam(required = false) Pedido.EstadoPedido estado,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDateTime fechaInicio,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDateTime fechaFin,
            @RequestParam(defaultValue = "0") int page,
            Model model) {

        Pageable pageable = PageRequest.of(page, adminSize);

        if (query != null && query.trim().isEmpty()) {
            query = null;
        }
        final String searchTerm = query;

        // Construimos los filtros dinámicos de forma totalmente segura para JPA/PostgreSQL
        org.springframework.data.jpa.domain.Specification<Pedido> spec = (root, consulta, builder) -> {
            var predicates = new java.util.ArrayList<jakarta.persistence.criteria.Predicate>();

            if (estado != null) {
                predicates.add(builder.equal(root.get("estado"), estado));
            }
            if (fechaInicio != null) {
                predicates.add(builder.greaterThanOrEqualTo(root.get("fechaPedido"), fechaInicio));
            }
            if (fechaFin != null) {
                predicates.add(builder.lessThanOrEqualTo(root.get("fechaPedido"), fechaFin));
            }
            if (searchTerm != null && !searchTerm.isBlank()) {
                String pattern = "%" + searchTerm.toLowerCase() + "%";
                var usuarioJoin = root.join("usuario");
                
                var idPredicate = builder.like(builder.toString(root.get("id")), pattern);
                var emailPredicate = builder.like(builder.lower(usuarioJoin.get("email")), pattern);
                var nombrePredicate = builder.like(builder.lower(usuarioJoin.get("nombre")), pattern);

                predicates.add(builder.or(idPredicate, emailPredicate, nombrePredicate));
            }

            return builder.and(predicates.toArray(new jakarta.persistence.criteria.Predicate[0]));
        };

        Page<Pedido> pedidosPage = pedidoRepository.findAll(spec, pageable);
        
        model.addAttribute("elementos", pedidosPage);
        model.addAttribute("currentPage", pedidosPage.getNumber());
        model.addAttribute("totalPages", pedidosPage.getTotalPages());
        model.addAttribute("hasPrevious", pedidosPage.hasPrevious());
        model.addAttribute("hasNext", pedidosPage.hasNext());

        // Parámetros para mantener los filtros seleccionados en la vista HTML
        model.addAttribute("query", query);
        model.addAttribute("estadoSeleccionado", estado);
        model.addAttribute("fechaInicio", fechaInicio);
        model.addAttribute("fechaFin", fechaFin);
        model.addAttribute("estadosDisponibles", Pedido.EstadoPedido.values()); // Para poblar el select de estados
        
        return "admin/pedidos/listar"; // Vista HTML en templates/admin/pedidos.html
    }

    // Cambiar estado o cancelar pedido desde el admin
    @PostMapping("/actualizar-estado/{id}")
    public String cambiarEstadoPedido(@PathVariable Long id, @RequestParam Pedido.EstadoPedido nuevoEstado) {
        Pedido pedido = pedidoRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Pedido no encontrado"));

        Pedido.EstadoPedido estadoAnterior = pedido.getEstado();

        // Si el admin decide cancelar un pedido que no estaba cancelado, devolvemos el stock
        if (nuevoEstado == Pedido.EstadoPedido.CANCELADO && pedido.getEstado() != Pedido.EstadoPedido.CANCELADO) {
            for (DetallePedido detalle : pedido.getDetalles()) {
                Producto producto = detalle.getProducto();
                producto.setStock(producto.getStock() + detalle.getCantidad());
                productoRepository.save(producto);
            }
        }

        // 📧 Si el pedido pasa a estar ENVIADO (y antes no lo estaba), disparamos correo al cliente
        if (nuevoEstado == Pedido.EstadoPedido.ENVIADO && estadoAnterior != Pedido.EstadoPedido.ENVIADO) {
            String emailDestino = pedido.getUsuario().getEmail();
            
            // Opcional: Puedes crear un método en tu EmailService específico como enviarCorreoEnvio(emailDestino, pedido.getId())
            // o reutilizar uno genérico de actualización de estado.
            emailService.enviarCorreoEnvio(emailDestino, pedido.getId(), pedido.getDetalles());
        }

        pedido.setEstado(nuevoEstado);
        pedidoRepository.save(pedido);

        return "redirect:/admin/pedidos";
    }
}
