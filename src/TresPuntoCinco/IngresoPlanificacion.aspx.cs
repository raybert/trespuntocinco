using System;
using System.Globalization;
using System.Web.UI;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;

namespace TresPuntoCinco
{
    public partial class IngresoPlanificacion : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            FechaInicio.Text = DateTime.Now.ToShortDateString();
            FechaFin.Text = DateTime.Now.AddDays(1).ToShortDateString();

            var colaborador = new ColaboradorBusiness();
            var unidadMedida = new UnidadMedidaBusiness();
            var ruta = new RutaBusiness();
            var unidad = new UnidadBusiness();
            var cliente = new ClienteBusiness();

            Colaboradores.DataSource = colaborador.ObtenerColaboradores(true).ListaColaboradores;
            Rutas.DataSource = ruta.ObtenerRutas().ListaRutas;
            UnidadesMedida.DataSource = unidadMedida.ObtenerUnidadesMedida(true).ListaUnidadMedida;
            Unidades.DataSource = unidad.ObtenerUnidades().ListaUnidades;
            Clientes.DataSource = cliente.ObtenerClientes(true).ListaClientes;

            Colaboradores.DataBind();
            Rutas.DataBind();
            UnidadesMedida.DataBind();
            Unidades.DataBind();
            Clientes.DataBind();

            if (Request.QueryString["IdPlanificacion"] == null) return;

            var idLugar = Request.QueryString["IdPlanificacion"];
            ObtenerDatosPlanificacion(Convert.ToInt32(idLugar));
        }

        private void ObtenerDatosPlanificacion(int idPlanificacion)
        {
            var planificacionBusiness = new PlanificacionBussines();
            var planificacion = planificacionBusiness.ObtenerPlanificacionPorId(idPlanificacion).DatosPlanificacion;
            if (planificacion == null) return;

            Clientes.Items.FindByValue(planificacion.IdCliente.ToString(CultureInfo.InvariantCulture)).Selected = true;
            Colaboradores.Items.FindByValue(planificacion.IdConductor.ToString(CultureInfo.InvariantCulture)).Selected = true;
            Rutas.Items.FindByValue(planificacion.IdRuta.ToString(CultureInfo.InvariantCulture)).Selected = true;
            UnidadesMedida.Items.FindByValue(planificacion.IdUnidadMedida.ToString(CultureInfo.InvariantCulture)).Selected = true;
            Unidades.Items.FindByValue(planificacion.IdUnidad.ToString(CultureInfo.InvariantCulture)).Selected = true;
            NombreCarga.Text = planificacion.Carga;
            FormaDePago.Items.FindByValue(planificacion.FormaPago.ToString(CultureInfo.InvariantCulture)).Selected = true;
            FechaInicio.Text = planificacion.FechaInicio.ToShortDateString();
        }

        protected void Grabar_Click(object sender, EventArgs e)
        {
            var planificacionBusiness = new PlanificacionBussines();
            var planificacion = new Model.Planificacion
            {
                FechaInicio = Convert.ToDateTime(FechaInicio.Text),
                FechaFin = Convert.ToDateTime(FechaFin .Text),
                FormaPago = FormaDePago.SelectedItem.Value,
                IdCliente = Convert.ToInt32(Clientes.SelectedItem.Value),
                IdConductor = Convert.ToInt32(Colaboradores.SelectedItem.Value),
                IdRuta = Convert.ToInt32(Rutas.SelectedItem.Value),
                IdUnidad = Convert.ToInt32(Unidades.SelectedItem.Value),
                IdUnidadMedida = Convert.ToInt32(UnidadesMedida.SelectedItem.Value)
            };

            if (Request.QueryString["IdPlanificacion"] != null)
                planificacion.IdPlanificacion = Convert.ToInt32(Request.QueryString["IdPlanificacion"]);

            planificacionBusiness.GrabarPlanificacion(planificacion);
            Response.Redirect("Planificacion.aspx");
        }
    }
}