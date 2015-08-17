<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="IngresoPlanificacion.aspx.cs" Inherits="TresPuntoCinco.IngresoPlanificacion" %>

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


                <div class="tabbable">
                    <ul class="nav nav-tabs" id="myTab">
                        <li class="active">
                            <a data-toggle="tab" href="#ConTrabajo">
                                <i class="green ace-icon icon-truck bigger-120"></i>
                                Con Trabajo
                            </a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#SinTrabajo">
                                <i class="red ace-icon icon-circle-arrow-down bigger-120"></i>
                                Sin Trabajo
														
                            </a>
                        </li>


                    </ul>

                    <div class="tab-content">
                        <div id="ConTrabajo" class="tab-pane fade in active">
                            <div class="row-fluid">
                                <div>
                                    <label for="<%= Clientes.ClientID %>">
                                        Cliente</label>
                                    <asp:DropDownList ID="Clientes" class="form-control" Width="60%" Style="width: 60%;" DataTextField="RazonSocial"
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

                            </div>
                        </div>
                        <div id="SinTrabajo" class="tab-pane fade">
                            <div>
                                <label for="form-field-select-1">Raz&oacute;nes de Falta de Trabajo</label>

                                <select class="form-control" id="form-field-select-1">
                                    <option value=""></option>
                                    <option value="1">Capacitaci&oacute;n Chofer</option>
                                    <option value="2">Tra&aacute;mites</option>
                                    <option value="3">Mantenimiento</option>
                                    <option value="4">Vacaciones Chofer</option>
                                </select>
                                <div class="control-group">
                                    <label class="control-label bolder blue">Fecha</label>


                                    <table id="simple-table" class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="width: 14%; text-align: center;"><b>Lunes</b></th>
                                                <th style="width: 14%; text-align: center;"><b>Martes</b></th>
                                                <th style="width: 14%; text-align: center;"><b>Mi&eacute;rcoles</b></th>
                                                <th style="width: 14%; text-align: center;"><b>Jueves</b></th>
                                                <th style="width: 14%; text-align: center;"><b>Viernes</b></th>
                                                <th style="width: 14%; text-align: center;"><b>Sabado</b></th>
                                                <th style="width: 14%; text-align: center;"><b>Domingo</b></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td style="width: 14%;">
                                                    <div class="checkbox">
                                                        <label>
                                                            &nbsp;&nbsp;<input name="form-field-checkbox" type="checkbox" class="ace ace-checkbox-2" />
                                                            <span class="lbl">&nbsp;&nbsp;17/08</span>
                                                        </label>
                                                    </div>

                                                </td>
                                                <td style="width: 14%;">
                                                    <div class="checkbox">
                                                        <label>
                                                            &nbsp;&nbsp;<input name="form-field-checkbox" type="checkbox" class="ace ace-checkbox-2" />
                                                            <span class="lbl">&nbsp;&nbsp;18/08</span>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td style="width: 14%;">
                                                    <div class="checkbox">
                                                        <label>
                                                            &nbsp;&nbsp;<input name="form-field-checkbox" class="ace ace-checkbox-2" type="checkbox" />
                                                            <span class="lbl">&nbsp;&nbsp;19/08</span>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td style="width: 14%;">
                                                    <div class="checkbox">
                                                        <label>
                                                            &nbsp;&nbsp;<input name="form-field-checkbox" class="ace ace-checkbox-2" type="checkbox" />
                                                            <span class="lbl">&nbsp;&nbsp;20/08</span>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td style="width: 14%;">
                                                    <div class="checkbox">
                                                        <label>
                                                            &nbsp;&nbsp;<input name="form-field-checkbox" class="ace ace-checkbox-2" type="checkbox" />
                                                            <span class="lbl">&nbsp;&nbsp;21/08</span>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td style="width: 14%;">
                                                    <div class="checkbox">
                                                        <label>
                                                            &nbsp;&nbsp;<input name="form-field-checkbox" class="ace ace-checkbox-2" type="checkbox" />
                                                            <span class="lbl">&nbsp;&nbsp;22/08</span>
                                                        </label>
                                                    </div>
                                                </td>
                                                <td style="width: 14%;">
                                                    <div class="checkbox">
                                                        <label>
                                                            &nbsp;&nbsp;<input name="form-field-checkbox" class="ace ace-checkbox-2" type="checkbox" />
                                                            <span class="lbl">&nbsp;&nbsp;23/08</span>
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
        });
    </script>
</asp:Content>
