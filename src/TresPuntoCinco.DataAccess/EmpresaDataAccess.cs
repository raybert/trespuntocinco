using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class EmpresaDataAccess
    {
        public List<Empresa> ObtenerEmpresas()
        {
            return DbHelper.SelectObject<Empresa>();
        }

        public Empresa ObtenerEmpresaPorIdentificacion(int idEmpresa)
		{
            return DbHelper.SelectObjectById<Empresa>(new { IdEmpresa = idEmpresa });
		}
	}
}
