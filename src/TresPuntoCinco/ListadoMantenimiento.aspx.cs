using System;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;

namespace TresPuntoCinco
{
    public partial class ListadoMantenimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            FechaInicio.Text = DateTime.Now.ToShortDateString();
            FechaFin.Text = DateTime.Now.AddDays(7).ToShortDateString();
            RecuperarDatos();
        }

        private void RecuperarDatos()
        {
            var mtoBusiness = new MantenimientoBusiness();
            var fechaInicio = Convert.ToDateTime(FechaInicio.Text);
            var fechaFin = Convert.ToDateTime(FechaFin.Text);

            ListaMantenimientos.DataSource = (mtoBusiness.ObtenerMantenimientos(fechaInicio, fechaFin)).ListaMantenimientos;
            ListaMantenimientos.DataBind();
        }

        protected void NuevoMantenimiento_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EditarMantenimiento.aspx", true);
        }

        protected void ListaMantenimientos_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedDataKey = ((GridView)sender).SelectedDataKey;
            if (selectedDataKey == null) return;
            var idMantenimiento = selectedDataKey.Value.ToString();
            Response.Redirect("EditarMantenimiento.aspx?idMantenimiento=" + idMantenimiento, true);
        }

        protected void FechaInicio_TextChanged(object sender, EventArgs e)
        {
            RecuperarDatos();
        }

        protected void FechaFin_TextChanged(object sender, EventArgs e)
        {
            RecuperarDatos();
        }
    }
}