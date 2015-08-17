using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class UnidadDataAccess
    {
        public List<Unidad> ObtenerUnidades()
        {
            //return DbHelper.SelectObject<Unidad>();
            return DbHelper.SelectObjectWithQuery<Unidad>("SELECT IdUnidad, IdEmpresa, Placa, Capacidad, IdTipoUnidad, Tipo FROM Unidad");
        }

        public Unidad ObtenerUnidadPorIdentificacion(int idUnidad)
		{
            return DbHelper.SelectObjectById<Unidad>(new { IdUnidad = idUnidad });
		}

	}
}
