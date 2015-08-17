<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditarMantenimiento.aspx.cs" Inherits="TresPuntoCinco.EditarMantenimiento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Mantenimiento</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Unidad <small><i class="icon-double-angle-right"></i>&nbsp;Editar Mantenimiento
                        </small>
                    </h1>
                </div>
                <!--/.page-header-->
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label">
                            Unidad:</label>
                        <div class="controls">
                            <asp:DropDownList ID="Unidad" runat="server" DataValueField="IdUnidad" DataTextField="Placa">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Fecha Inicio:</label>
                        <div class="col-sm-9">
                            <div class="input-group input-group-sm">
                                <asp:TextBox ID="FechaInicio" class="form-control" data-date-format="dd/mm/yyyy"
                                    runat="server" />
                                <span class="input-group-addon"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Fecha Fin:</label>
                        <div class="col-sm-9">
                            <div class="input-group input-group-sm">
                                <asp:TextBox ID="FechaFin" class="form-control" data-date-format="dd/mm/yyyy" runat="server" />
                                <span class="input-group-addon"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="button" runat="server" id="Grabar" onserverclick="Grabar_OnClick">
                            <i class="icon-save bigger-110"></i>Grabar
                        </button>
                        &nbsp; &nbsp; &nbsp;
                        <button class="btn btn-danger" type="reset" runat="server" id="Cancelar" onserverclick="Cancelar_OnClick">
                            <i class="icon-undo bigger-110"></i>Cancelar
                        </button>
                    </div>
                    <div class="hr">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="InlineScripts" runat="server">
    <script type="text/javascript" language="javascript">
        jQuery(function ($) {
            $("#<%= FechaInicio.ClientID %>").datepicker({
                showOtherMonths: true,
                selectOtherMonths: false
            });

            $("#<%= FechaFin.ClientID %>").datepicker({
                showOtherMonths: true,
                selectOtherMonths: false
            });
        });
    </script>
</asp:Content>
