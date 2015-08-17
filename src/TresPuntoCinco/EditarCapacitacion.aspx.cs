using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;

namespace TresPuntoCinco
{
    public partial class EditarCapacitacion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            if (Request.QueryString["IdColaborador"] == null) return;
            var idColaborador = Request.QueryString["IdColaborador"];
            ObtenerDatos(Convert.ToInt32(idColaborador));
        }

        private void ObtenerDatos(int idColaborador)
        {
            var colaboradorBusiness = new ColaboradorBusiness();
            var capacitacion = colaboradorBusiness.ObtenerCapacitacionPorId(idColaborador).CapacitacionParaEditar;

            NombreCapacitacion.Text = capacitacion.NombreCapacitacion;
            Institucion.Text = capacitacion.Institucion;
            Fecha.Text = capacitacion.Fecha.ToShortDateString();
        }

        protected void Grabar_OnClick(object sender, EventArgs e)
        {
            var colaboradorBusiness = new ColaboradorBusiness();
            var capacitacion = new Capacitacion
            {
                NombreCapacitacion = NombreCapacitacion.Text,
                Institucion= Institucion.Text,
                Fecha = Convert.ToDateTime(Fecha.Text),
            };

            if (Request.QueryString["IdColaborador"] != null)
                capacitacion.IdColaborador = Convert.ToInt32(Request.QueryString["IdColaborador"]);

            if (Request.QueryString["IdCapacitacion"] != null)
                capacitacion.IdCapacitacion = Convert.ToInt32(Request.QueryString["IdCapacitacion"]);

            colaboradorBusiness.GrabarCapacitacion(capacitacion);

            RedirigirPaginaPadre();
        }

        private void RedirigirPaginaPadre()
        {
            Response.Redirect("EditarColaborador.aspx?IdColaborador=" + Request.QueryString["IdColaborador"], true);
        }

        protected void Cancelar_OnClick(object sender, EventArgs e)
        {
            RedirigirPaginaPadre();
        }
    }
}
