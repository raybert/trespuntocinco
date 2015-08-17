using TresPuntoCinco.Model;

namespace TresPuntoCinco.ViewModel
{
	public class PlanificacionViewModel
	{
		public string NombreDia { get; set; }
		public string Unidad { get; set; }
		public string Conductor { get; set; }
		//public List<DetallePlanificacionViewModel> Dia { get; set; }
		public DetallePlanificacionViewModel DiaUno { get; set; }
        public DetallePlanificacionViewModel DiaDos { get; set; }
        public DetallePlanificacionViewModel DiaTres { get; set; }
        public DetallePlanificacionViewModel DiaCuatro { get; set; }

        public Planificacion DatosPlanificacion { get; set; }
	}
}
