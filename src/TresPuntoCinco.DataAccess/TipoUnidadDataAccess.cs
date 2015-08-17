using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class TipoUnidadDataAccess
    {
        public List<TipoUnidad> ObtenerTiposUnidad()
        {
            return DbHelper.SelectObject<TipoUnidad>();
        }

        public TipoUnidad ObtenerTipoUnidadPorIdentificacion(int idTipoUnidad)
		{
            return DbHelper.SelectObjectById<TipoUnidad>(new { IdTipoUnidad = idTipoUnidad });
		}
	}
}
