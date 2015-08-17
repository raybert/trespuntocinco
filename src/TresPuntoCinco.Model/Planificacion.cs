using System;

namespace TresPuntoCinco.Model
{
    public class Planificacion
    {
        public int IdPlanificacion { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public int IdConductor { get; set; }
        public int IdCliente { get; set; }
        public int IdRuta { get; set; }
        public int IdUnidad { get; set; }
        public int IdUnidadMedida { get; set; }
        public string FormaPago { get; set; }
        public string Carga { get; set; }
    }
}