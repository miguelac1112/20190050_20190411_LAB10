package com.example.lab10.Beans;

public class Viaje {
    private String id_viaje;
    private int id_destino;
    private int costo_unitario;
    private String fecha_reserva;
    private String fecha_viaje;
    private String ciudad_origen;
    private String ciudad_destino;
    private String empresa_seguro;
    private int cant_boletos;
    private int costo_total;


    public int getCosto_unitario() {
        return costo_unitario;
    }

    public void setCosto_unitario(int costo_unitario) {
        this.costo_unitario = costo_unitario;
    }

    public int getId_destino() {
        return id_destino;
    }

    public void setId_destino(int id_destino) {
        this.id_destino = id_destino;
    }

    public String getId_viaje() {
        return id_viaje;
    }

    public void setId_viaje(String id_viaje) {
        this.id_viaje = id_viaje;
    }

    public String getFecha_reserva() {
        return fecha_reserva;
    }

    public void setFecha_reserva(String fecha_reserva) {
        this.fecha_reserva = fecha_reserva;
    }

    public String getFecha_viaje() {
        return fecha_viaje;
    }

    public void setFecha_viaje(String fecha_viaje) {
        this.fecha_viaje = fecha_viaje;
    }

    public String getCiudad_origen() {
        return ciudad_origen;
    }

    public void setCiudad_origen(String ciudad_origen) {
        this.ciudad_origen = ciudad_origen;
    }

    public String getCiudad_destino() {
        return ciudad_destino;
    }

    public void setCiudad_destino(String ciudad_destino) {
        this.ciudad_destino = ciudad_destino;
    }

    public String getEmpresa_seguro() {
        return empresa_seguro;
    }

    public void setEmpresa_seguro(String empresa_seguro) {
        this.empresa_seguro = empresa_seguro;
    }

    public int getCant_boletos() {
        return cant_boletos;
    }

    public void setCant_boletos(int cant_boletos) {
        this.cant_boletos = cant_boletos;
    }

    public int getCosto_total() {
        return costo_total;
    }

    public void setCosto_total(int costo_total) {
        this.costo_total = costo_total;
    }
}
