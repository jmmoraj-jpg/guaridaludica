package com.shop.guaridaludica.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.shop.guaridaludica.model.Pedido;
import com.shop.guaridaludica.model.Usuario;

public interface PedidoRepository extends JpaRepository<Pedido, Long>, JpaSpecificationExecutor<Pedido> {
    long countByUsuarioId(Long usuarioId);
    
    // Método rápido para saber si existen pedidos asociados a un ID de usuario
    boolean existsByUsuarioId(Long usuarioId);

    // Para listar los pedidos del usuario en su panel, del más nuevo al más antiguo
    List<Pedido> findByUsuarioOrderByFechaPedidoDesc(Usuario usuario);

    // 🕒 Para buscar pedidos pendientes anteriores a una fecha límite (ideal para la tarea de caducidad)
    List<Pedido> findByEstadoAndFechaPedidoBefore(Pedido.EstadoPedido estado, LocalDateTime fechaLimite);

    // Consulta unificada optimizada
    /*
    @Query("SELECT p FROM Pedido p WHERE " +
           "(:estado IS NULL OR p.estado = :estado) AND " +
           "(:fechaInicio IS NULL OR p.fechaPedido >= :fechaInicio) AND " +
           "(:fechaFin IS NULL OR p.fechaPedido <= :fechaFin) AND " +
           "(:query IS NULL OR :query = '' OR STR(p.id) LIKE LOWER(CONCAT('%', :query, '%')) " +
           "OR lower(p.usuario.email) LIKE lower(CONCAT('%', :query, '%')) " +
           "OR lower(p.usuario.nombre) LIKE lower(CONCAT('%', :query, '%')))")
    Page<Pedido> filtrarPedidos(
            @Param("estado") Pedido.EstadoPedido estado,
            @Param("query") String query,
            @Param("fechaInicio") LocalDate fechaInicio,
            @Param("fechaFin") LocalDate fechaFin,
            Pageable pageable
    );
    */

    // Método mágico de Spring Data JPA para contar por estado
    long countByEstado(Pedido.EstadoPedido estado);
}