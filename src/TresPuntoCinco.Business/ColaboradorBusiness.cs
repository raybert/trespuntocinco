using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;
using TresPuntoCinco.DataAccess;

namespace TresPuntoCinco.Business
{
    public class ColaboradorBusiness
    {
        public ColaboradorViewModel ObtenerColaboradores(bool estado)
        {
            var colaboradorData =  new ColaboradorDataAccess();
            return new ColaboradorViewModel { ListaColaboradores = colaboradorData.ObtenerColaboradores(estado) };
		}

		public Colaborador ObtenerClientesPorIdentificacion(int idColaborador)
		{
			var colaboradorData = new ColaboradorDataAccess();
            return colaboradorData.ObtenerClientePorIdentificacion(idColaborador);
		}

        public int GrabarColaborador(Colaborador colaborador)
        {
            var colaboradorData = new ColaboradorDataAccess();
            return colaboradorData.GrabarColaborador(colaborador);
        }

        public ColaboradorViewModel ObtenerCapacitacionesPorColaborador(int idColaborador)
        {
            var colaboradorData = new ColaboradorDataAccess();
            return new ColaboradorViewModel { ListaCapacitaciones = colaboradorData.ObtenerCapacitaciones(idColaborador) };
        }

        public ColaboradorViewModel ObtenerCapacitacionPorId(int idCapacitacion)
        {
            var colaboradorData = new ColaboradorDataAccess();
            return new ColaboradorViewModel { CapacitacionParaEditar = colaboradorData.ObtenerCapacitacionPorId(idCapacitacion) };
        }

        public int GrabarCapacitacion(Capacitacion capacitacion)
        {
            var colaboradorData = new ColaboradorDataAccess();
            return colaboradorData.GrabarCapacitacion(capacitacion);
        }

    }
}
