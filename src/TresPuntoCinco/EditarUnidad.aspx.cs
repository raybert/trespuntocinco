using System;
using System.Globalization;
using System.Web.UI;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;

namespace TresPuntoCinco
{
    public partial class EditarUnidad : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            var tipoUnidadBusiness = new TipoUnidadBusiness();
            TipoUnidad.DataSource = tipoUnidadBusiness.ObtenerTipoUnidad().ListaTipoUnidad;
            TipoUnidad.DataBind();
            
            var empresaBusiness = new EmpresaBusiness();
            Empresa.DataSource = empresaBusiness.ObtenerEmpresas().ListaEmpresas;
            Empresa.DataBind();

            var unidadMedidaBusiness = new UnidadMedidaBusiness();
            UnidadesMedida.DataSource = unidadMedidaBusiness.ObtenerUnidadesMedida(true).ListaUnidadMedida;
            UnidadesMedida.DataBind();

            if (Request.QueryString["IdUnidad"] == null) return;

            var idLugar = Request.QueryString["IdUnidad"];
            ObtenerDatosUnidad(Convert.ToInt32(idLugar));
        }

        private void ObtenerDatosUnidad(int idUnidad)
        {
            var unidadBusiness = new UnidadBusiness();
            var unidad = unidadBusiness.ObtenerUnidadPorCodigo(idUnidad).DatosUnidad;
            if (unidad == null) return;

            Placa.Text = unidad.Placa;
            Capacidad.Text = unidad.Capacidad;
            Empresa.Items.FindByValue(unidad.IdEmpresa.ToString(CultureInfo.InvariantCulture)).Selected = true;
            TipoUnidad.Items.FindByValue(unidad.IdTipoUnidad.ToString(CultureInfo.InvariantCulture)).Selected = true;
            UnidadesMedida.Items.FindByValue(unidad.IdUnidadMedida.ToString(CultureInfo.InvariantCulture)).Selected = true;
            Marca.Text = unidad.Marca;
            Modelo.Text = unidad.Modelo;
        }

        protected void Grabar_OnClick(object sender, EventArgs e)
        {
            var unidadNegocio = new UnidadBusiness();
            var unidad = new Unidad
                {
                    Placa = Placa.Text,
                    Capacidad = Capacidad.Text,
                    IdTipoUnidad = Convert.ToInt32(TipoUnidad.SelectedItem.Value),
                    IdEmpresa = Convert.ToInt32(Empresa.SelectedItem.Value),
                    IdUnidadMedida = Convert.ToInt32(UnidadesMedida.SelectedItem.Value),
                    Marca = Marca.Text,
                    Modelo = Modelo.Text
                };

            if (Request.QueryString["IdUnidad"] != null)
                unidad.IdUnidad = Convert.ToInt32(Request.QueryString["IdUnidad"]);

            unidadNegocio.GrabarUnidad(unidad);
            Response.Redirect("ListadoUnidad.aspx");
        }

        protected void Cancelar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ListadoUnidad.aspx");
        }
    }
}