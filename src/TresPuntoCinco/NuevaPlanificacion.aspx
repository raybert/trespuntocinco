<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NuevaPlanificacion.aspx.cs" Inherits="TresPuntoCinco.NuevaPlanificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right"></i></span></li>
                    <li class="active">Nueva Planificacion</li>
                </ul>
            </div>


            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>Planificaci&oacute;n <small><i class="icon-double-angle-right"></i>&nbsp;Nueva Planificaci&oacute;n
                    </small>
                    </h1>
                </div>
                <!--/.page-header-->

                <div class="row-fluid">
                    <div>
                        <label for="<%= Clientes.ClientID %>">
                            Cliente</label>
                        <asp:DropDownList ID="Clientes" class="form-control" DataTextField="RazonSocial"
                            DataValueField="IdCliente" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <label for="<%= Colaboradores.ClientID %>">
                            Conductor</label>
                        <asp:DropDownList ID="Colaboradores" class="form-control" DataTextField="Nombre"
                            DataValueField="IdColaborador" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <label for="<%= Rutas.ClientID %>">
                            Ruta</label>
                        <asp:DropDownList ID="Rutas" class="form-control" DataTextField="NombreRuta" DataValueField="IdRuta"
                            runat="server">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <label for="<%= UnidadesMedida.ClientID %>">
                            Unidad de Medida</label>
                        <asp:DropDownList ID="UnidadesMedida" class="form-control" DataTextField="Medida"
                            DataValueField="IdUnidadMedida" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <label for="<%= Unidades.ClientID %>">
                            Unidad</label>
                        <asp:DropDownList ID="Unidades" class="form-control" DataTextField="Placa" DataValueField="IdUnidad"
                            runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group" style="display: none">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= NombreCarga.ClientID %>">
                            Carga
                        </label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="NombreCarga" placeholder="Carga" class="col-xs-10 col-sm-5" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group" style="display: none">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= FormaDePago.ClientID %>">
                            Forma de Pago
                        </label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="FormaDePago" class="form-control" DataTextField="Placa" DataValueField="IdUnidad"
                                runat="server">
                                <asp:ListItem Value="1">Credito</asp:ListItem>
                                <asp:ListItem Value="2">Contado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= FechaInicio.ClientID %>">
                            Fecha inicio
                        </label>
                        <div class="col-sm-9">
                            <div class="input-group input-group-sm">
                                <asp:TextBox ID="FechaInicio" class="form-control" data-date-format="dd/mm/yyyy" runat="server"></asp:TextBox>
                                <span class="input-group-addon"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" for="<%= FechaFin.ClientID %>">
                            Fecha fin
                        </label>
                        <div class="col-sm-9">
                            <div class="input-group input-group-sm">
                                <asp:TextBox ID="FechaFin" class="form-control" data-date-format="dd/mm/yyyy" runat="server"></asp:TextBox>
                                <span class="input-group-addon"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= FormaPago.ClientID %>">">
                            Fecha
                        </label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="FormaPago" class="form-control" DataTextField="Placa" DataValueField="IdUnidad"
                                runat="server">
                                <asp:ListItem Value="1">Credito</asp:ListItem>
                                <asp:ListItem Value="2">Contado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>--%>
                </div>
            </div>

            <div class="space-4">
            </div>
            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <asp:Button ID="Grabar" class="btn btn-info" runat="server" Text="Grabar" OnClick="Grabar_Click" />
                    &nbsp; &nbsp; &nbsp;
                            <asp:Button ID="Cancelar" class="btn btn-danger" runat="server" Text="Cancelar" />
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="InlineContent" ContentPlaceHolderID="InlineScripts" runat="server">
    <script type="text/javascript">
        jQuery(function ($) {
            $("#<%= FechaInicio.ClientID %>").datepicker({
                showOtherMonths: true,
                format: 'dd/mm/yyyy',
                selectOtherMonths: false
            });

            $("#<%= FechaFin.ClientID %>").datepicker({
                showOtherMonths: true,
                format: 'dd/mm/yyyy',
                selectOtherMonths: false
            });

            $('#<%= FechaInicio.ClientID %>').on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });

            $('#<%= FechaFin.ClientID %>').on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });

            $("#tabs").tabs();

        });
    </script>
</asp:Content>
