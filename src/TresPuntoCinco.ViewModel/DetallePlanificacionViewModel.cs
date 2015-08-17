using System.Text;

namespace TresPuntoCinco.ViewModel
{
	public class DetallePlanificacionViewModel
	{
		public string Cliente { get; set; }
		public string Ruta { get; set; }
		public string Carga { get; set; }
		public string UnidadMedida { get; set; }
		public bool SinAsignacion { get; set; }

		public override string ToString()
		{
			var htmlText = new StringBuilder();
			var labelType = (Ruta == string.Empty) ? "label-important" : "label-info";
			labelType = (SinAsignacion && Ruta != string.Empty) ? "label-warning" : labelType;

			htmlText.AppendFormat("<span class=\"label {0}\" style=\"width: 90%\">", labelType);
			htmlText.AppendFormat("<i class=\"icon-building\"></i>&nbsp; {0} <br />", (Cliente == string.Empty) ? "--" : Cliente);
			htmlText.AppendFormat("<i class=\"icon-road\"></i>&nbsp; {0} <br />", (Ruta == string.Empty) ? "Sin Asignación" : Ruta);
			htmlText.AppendFormat("<i class=\"icon-tags\"></i>&nbsp; {0} <br />", (UnidadMedida == string.Empty) ? "--" : UnidadMedida);
			htmlText.AppendFormat("<i class=\"icon-th-large\"></i>&nbsp; {0} <br />", (Carga == string.Empty) ? "--" : Carga);
			htmlText.Append("</span>");

			return htmlText.ToString();
			/*return string.Format("<span class=\"label {4}\" style=\"width: 90%\">" +
								 "<i class=\"icon-building\"></i>&nbsp; {0} <br />" +
								 "<i class=\"icon-road\"></i>&nbsp; {1} <br />" +
								 "<i class=\"icon-tags\"></i>&nbsp; {2} <br />" +
								 "<i class=\"icon-th-large\"></i>&nbsp; {3} <br />" +
								 "</span>", Ruta, Cliente, UnidadMedida, Carga, labelType);*/
		}
	}
}
