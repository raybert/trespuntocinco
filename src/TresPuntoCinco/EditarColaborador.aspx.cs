using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;

namespace TresPuntoCinco
{
    public partial class EditarColaborador : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            if (Request.QueryString["IdColaborador"] == null) return;
            var idColaborador = Request.QueryString["IdColaborador"];
            ObtenerDatosCliente(Convert.ToInt32(idColaborador));
            ObtenerCapacitaciones(Convert.ToInt32(idColaborador));
        }

        private void ObtenerCapacitaciones(int idColaborador)
        {
            var colaboradorBusiness = new ColaboradorBusiness();
            var colaborador = colaboradorBusiness.ObtenerCapacitacionesPorColaborador(idColaborador);
            ListaCapacitaciones.DataSource = colaborador.ListaCapacitaciones;
            ListaCapacitaciones.DataBind();
        }

        private void ObtenerDatosCliente(int idColaborador)
        {
            var colaboradorBusiness = new ColaboradorBusiness();
            var colaborador = colaboradorBusiness.ObtenerClientesPorIdentificacion(idColaborador);
            Nombre.Text = colaborador.Nombre;
            Apellidos.Text = colaborador.Apellidos;
            Domicilio.Text = colaborador.Domicilio;
            Documento.Text = colaborador.Documento;
            Telefono.Text = colaborador.Telefono;
            NumeroBrevete.Text = colaborador.NumeroBrevete;
            TipoBrevete.SelectedValue = colaborador.TipoBrevete;
        }

        protected void Grabar_OnClick(object sender, EventArgs e)
        {
            var colaboradorBusiness = new ColaboradorBusiness();
            var colaborador = new Colaborador
            {
                Nombre = Nombre.Text,
                Apellidos = Apellidos.Text,
                Domicilio = Domicilio.Text,
                Documento = Documento.Text,
                Telefono = Telefono.Text,
                NumeroBrevete = NumeroBrevete.Text,
                TipoBrevete = TipoBrevete.SelectedValue,
                Estado = "A"
            };

            if (Request.QueryString["IdColaborador"] != null)
                colaborador.IdColaborador = Convert.ToInt32(Request.QueryString["IdColaborador"]);

            colaboradorBusiness.GrabarColaborador(colaborador);

            Response.Redirect("ListadoColaborador.aspx", true);
        }

        protected void Cancelar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ListadoColaborador.aspx", true);
        }

        protected void ListaCapacitaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedDataKey = ((GridView)sender).SelectedDataKey;
            if (selectedDataKey == null) return;

            var idCapacitacion = selectedDataKey.Value.ToString();
            Response.Redirect(string.Format("EditarCapacitacion.aspx?IdColaborador={0}&IdCapacitacion={1}", Request.QueryString["IdColaborador"], idCapacitacion), true);
        }
    }
}