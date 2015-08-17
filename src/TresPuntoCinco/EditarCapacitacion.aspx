<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditarCapacitacion.aspx.cs" Inherits="TresPuntoCinco.EditarCapacitacion" %>

<asp:Content ID="TituloCapacitacion" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="ContentCapoacitacion" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Capacitaciones</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Capacitaciones <small><i class="icon-double-angle-right"></i>&nbsp;Editar informaci&oacute;n
                        </small>
                    </h1>
                </div>
                <!--/.page-header-->
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="<%= NombreCapacitacion.ClientID %>">
                            Nombre de Capacitaci&oacute;n</label>
                        <div class="controls">
                            <asp:TextBox ID="NombreCapacitacion" runat="server" placeholder="Nombre de capacitacion"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="<%= Institucion.ClientID %>">
                            Instituci&oacute;n</label>
                        <div class="controls">
                            <asp:TextBox ID="Institucion" runat="server" placeholder="Institucion"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="<%= Fecha.ClientID %>">
                            Fecha</label>
                        <div class="controls">
                            <asp:TextBox ID="Fecha" class="form-control" runat="server" />
                            &nbsp;<span class="input-group-addon"><i class="icon-calendar"></i></span>
                        </div>
                    </div>
                    <div class="hr">
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
    <script type="text/javascript" language="javascript">
        jQuery(function ($) {
            $("#<%= Fecha.ClientID %>").datepicker({
                showOtherMonths: true,
                selectOtherMonths: false
            });
        });
    </script>
</asp:Content>
