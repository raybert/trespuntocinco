using TresPuntoCinco.DataAccess;
using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco.Business
{
	public class RutaBusiness
	{
        public RutaViewModel ObtenerRutas()
        {
            var rutaData = new RutaDataAccess();
            return new RutaViewModel { ListaRutas = rutaData.ObtenerRutas() };
        }

        public RutaViewModel ObtenerRutaPorCodigo(int idRuta)
        {
            var rutaData = new RutaDataAccess();
            return new RutaViewModel { DatosRuta = rutaData.ObtenerRutaPorIdentificacion(idRuta) };
        }

        public int GrabarRuta(Ruta ruta)
        {
            return ruta.IdRuta == 0 ? Data.DbHelper.Insert(ruta) : Data.DbHelper.Update(ruta);
        }
	}
}
