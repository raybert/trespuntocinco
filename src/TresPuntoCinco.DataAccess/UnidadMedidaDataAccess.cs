using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class UnidadMedidaDataAccess
    {
        public List<UnidadMedida> ObtenerUnidadesMedida()
        {
            return DbHelper.SelectObject<UnidadMedida>();
        }

        public UnidadMedida ObtenerUnidadMedidaPorIdentificacion(int idUnidadMedida)
		{
            return DbHelper.SelectObjectById<UnidadMedida>(new { IdUnidadMedida = idUnidadMedida });
		}
	}
}
