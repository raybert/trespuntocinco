using System;

namespace TresPuntoCinco.ViewModel
{
	public class NuevaPlanificacionViewModel
	{
		public int Conductor { get; set; }
		public int Ruta { get; set; }
		public DateTime Fecha { get; set; }
		public int UnidadMedida { get; set; }
		public string Carga { get; set; }
	}
}
