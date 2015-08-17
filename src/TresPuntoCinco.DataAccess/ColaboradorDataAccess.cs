using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class ColaboradorDataAccess
    {
        public List<Colaborador> ObtenerColaboradores(bool estado)
        {
            return DbHelper.SelectObject<Colaborador>(new { Estado = (estado ? "A" : "I") });
        }

        public Colaborador ObtenerClientePorIdentificacion(int idColaborador)
		{
            return DbHelper.SelectObjectById<Colaborador>(new { IdColaborador = idColaborador });
		}

        public Colaborador ObtenerClientePorDocumento(int documento)
        {
            return DbHelper.SelectObjectById<Colaborador>(new { Documento = documento });
        }

        public List<Capacitacion> ObtenerCapacitaciones(int idColaborador)
        {
            return DbHelper.SelectObject<Capacitacion>(new { IdColaborador = idColaborador });
        }

        public Capacitacion ObtenerCapacitacionPorId(int idCapacitacion)
        {
            return DbHelper.SelectObjectById<Capacitacion>(new { IdCapacitacion = idCapacitacion });
        }

        public int GrabarColaborador(Colaborador colaborador)
        {
            return colaborador.IdColaborador == 0 ? DbHelper.Insert(colaborador) : DbHelper.Update(colaborador);
        }

        public int GrabarCapacitacion(Capacitacion capacitacion)
        {
            return capacitacion.IdCapacitacion == 0 ? DbHelper.Insert(capacitacion) : DbHelper.Update(capacitacion);
        }
    }
}
