namespace TresPuntoCinco.Model
{
    using System;

    public class Capacitacion
    {
        public int IdCapacitacion { get; set; }
        public int IdColaborador { get; set; }
        public string NombreCapacitacion { get; set; }
        public DateTime Fecha { get; set; }
        public string Institucion { get; set; }
    }
}
