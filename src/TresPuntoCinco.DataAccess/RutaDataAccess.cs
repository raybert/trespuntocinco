using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class RutaDataAccess
    {
        public List<Ruta> ObtenerRutas()
        {
            return DbHelper.SelectObject<Ruta>();
        }

        public Ruta ObtenerRutaPorIdentificacion(int idRuta)
        {
            return DbHelper.SelectObjectById<Ruta>(new { IdRuta = idRuta });
        }
    }
}