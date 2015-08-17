using System;
using System.Globalization;
using System.Web.UI;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;

namespace TresPuntoCinco
{
    public partial class EditarMantenimiento : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            var unidadBusiness = new UnidadBusiness();
            Unidad.DataSource = unidadBusiness.ObtenerUnidades().ListaUnidades;
            Unidad.DataBind();
            
            if (Request.QueryString["IdMantenimiento"] == null) return;

            var idMantenimiento = Request.QueryString["IdMantenimiento"];
            ObtenerDatosMantenimiento(Convert.ToInt32(idMantenimiento));
        }

        private void ObtenerDatosMantenimiento(int idMantenimiento)
        {
            var mantenimientoBusiness = new MantenimientoBusiness();
            var mantenimiento = mantenimientoBusiness.ObtenerMantenimientoPorCodigo(idMantenimiento).DatosMantenimiento;
            if (mantenimiento == null) return;

            FechaFin.Text = mantenimiento.FechaFin.ToShortDateString();
            FechaFin.Text = mantenimiento.FechaInicio.ToShortDateString();

            Unidad.Items.FindByValue(mantenimiento.IdUnidad.ToString(CultureInfo.InvariantCulture)).Selected = true;
        }

        protected void Grabar_OnClick(object sender, EventArgs e)
        {
            var mantenimientoNegocio = new MantenimientoBusiness();
            var mantenimiento = new Mantenimiento()
                {
                    FechaFin = Convert.ToDateTime(FechaFin.Text),
                    FechaInicio = Convert.ToDateTime(FechaInicio.Text),
                    IdUnidad = Convert.ToInt32(Unidad.SelectedItem.Value)
                };

            if (Request.QueryString["IdMantenimiento"] != null)
                mantenimiento.IdUnidad = Convert.ToInt32(Request.QueryString["IdMantenimiento"]);

            mantenimientoNegocio.GrabarMantenimiento(mantenimiento);
            Response.Redirect("ListadoMantenimiento.aspx");
        }

        protected void Cancelar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ListadoMantenimiento.aspx");
        }
    }
}