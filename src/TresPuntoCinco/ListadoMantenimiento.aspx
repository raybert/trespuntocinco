<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListadoMantenimiento.aspx.cs" Inherits="TresPuntoCinco.ListadoMantenimiento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Mantenimientos</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Mantenimiento <small><i class="icon-double-angle-right"></i>&nbsp;Listado de Mantenimientos
                        </small>
                    </h1>
                </div>
                <hr />
                <p style="text-align: right">
                    <button id="NuevoMantenimiento" class="btn btn-info" runat="server" onserverclick="NuevoMantenimiento_OnClick">
                        <i class="icon-plus-sign bigger-120"></i>&nbsp;Nuevo Mantenimiento
                    </button>
                    <%--<button class="btn btn-success">
                        <i class="icon-download-alt bigger-120"></i>&nbsp;Exportar
                    </button>--%>
                </p>
                <hr />
                <div class="row-fluid">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= FechaInicio.ClientID %>">
                            Fecha inicio
                        </label>
                        <div class="col-sm-9">
                            <div class="input-group input-group-sm">
                                <asp:TextBox ID="FechaInicio" class="form-control" data-date-format="dd/mm/yyyy"
                                    runat="server" ontextchanged="FechaInicio_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <span class="input-group-addon"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                        <label class="col-sm-3 control-label no-padding-right" for="<%= FechaFin.ClientID %>">
                            Fecha Fin
                        </label>
                        <div class="col-sm-9">
                            <div class="input-group input-group-sm">
                                <asp:TextBox ID="FechaFin" class="form-control" data-date-format="dd/mm/yyyy"
                                    runat="server" ontextchanged="FechaFin_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <span class="input-group-addon"><i class="icon-calendar"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="ListaMantenimientos" runat="server" CssClass="table table-striped table-bordered table-hover"
                            AutoGenerateColumns="False" DataKeyNames="IdMantenimiento" OnSelectedIndexChanged="ListaMantenimientos_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" />
                                <asp:BoundField DataField="IdMantenimiento" HeaderText="IdLugar" Visible="False" />
                                <asp:BoundField DataField="IdUnidad" HeaderText="IdUnidad" />
                                <asp:BoundField DataField="Placa" HeaderText="Unidad" />
                                <asp:TemplateField HeaderText="Fecha Inicio">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_shipped" runat="server" Text='<%# ((DateTime)DataBinder.Eval(Container.DataItem, "FechaInicio")).ToShortDateString() %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha Fin">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_shipped" runat="server" Text='<%# ((DateTime)DataBinder.Eval(Container.DataItem, "FechaFin")).ToShortDateString() %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="InlineContent" ContentPlaceHolderID="InlineScripts" runat="server">
    <script type="text/javascript" language="javascript">
        jQuery(function($) {
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
