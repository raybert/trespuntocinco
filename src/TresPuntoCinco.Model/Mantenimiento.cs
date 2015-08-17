using System;

namespace TresPuntoCinco.Model
{
    public class Mantenimiento
    {
        public int IdMantenimiento { get; set; }
        public int IdUnidad { get; set; }
        public string Placa { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
    }
}
