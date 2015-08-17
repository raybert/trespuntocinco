using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class LugarDataAccess
    {
        public List<Lugar> ObtenerLugares()
        {
            return DbHelper.SelectObject<Lugar>();
        }

        public Lugar ObtenerLugarPorIdentificacion(int idLugar)
		{
            return DbHelper.SelectObjectById<Lugar>(new { IdLugar = idLugar });
		}
	}
}
