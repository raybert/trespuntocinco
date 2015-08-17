using System;
using TresPuntoCinco.Business;

namespace TresPuntoCinco
{
    public partial class Planificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarDatos(DateTime.Now);
            }
        }

        protected void Semana_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void ListaPlanificacion_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {

        }

        protected void FechaInicio_OnTextChanged(object sender, EventArgs e)
        {
            DateTime fechaInicio;
            if (DateTime.TryParse(FechaInicio.Text, out fechaInicio))
                CargarDatos(fechaInicio);
        }

        protected void NuevaPlanificacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevaPlanificacion.aspx", true);
        }

        private void CargarDatos(DateTime fechaInicio)
        {
            var plan = new PlanificacionBussines();
            //ListaPlanificacion.DataSource = plan.ObtenerPlanificacion(fechaInicio, DateTime.Now);
            //ListaPlanificacion.DataBind();

            PlanificcacionDatos.DataSource = plan.ObtenerPlanificacion(fechaInicio);
            PlanificcacionDatos.DataBind();
        }
    }
}