namespace TresPuntoCinco.Model
{
    public class Ruta
    {
        public int IdRuta { get; set; }
        public int Origen { get; set; }
        public int Destino { get; set; }
        public string NombreRuta { get; set; }
        public string NombreCorto { get; set; }
        public int TiempoViaje { get; set; }
        public int Kilometraje { get; set; }
    }
}