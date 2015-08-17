<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Planificacion.aspx.cs" Inherits="TresPuntoCinco.Planificacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main-content" class="clearfix">
        <div id="breadcrumbs">
            <ul class="breadcrumb">
                <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                </i></span></li>
                <li class="active">Planificacion</li>
            </ul>
        </div>
        <div id="page-content" class="clearfix">
            <div class="page-header position-relative">
                <h1>
                    Planificaci&oacute;n <small><i class="icon-double-angle-right"></i>Planning Semanal
                    </small>
                </h1>
            </div>
            <!--/.page-header-->
            <div class="row-fluid">
                <hr />
                <p style="text-align: right">
                    <button class="btn btn-info" runat="server" onserverclick="NuevaPlanificacion_Click">
                        <i class="icon-plus-sign bigger-120"></i>&nbsp;Nueva Planificaci&oacute;n
                    </button>
                    <button class="btn btn-success" style="display: none">
                        <i class="icon-download-alt bigger-120"></i>&nbsp;Exportar
                    </button>
                </p>
                <hr />
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="<%= FechaInicio.ClientID %>">
                        Fecha inicio
                    </label>
                    <div class="col-sm-9">
                        <div class="input-group input-group-sm">
                            <asp:TextBox ID="FechaInicio" AutoPostBack="True" OnTextChanged="FechaInicio_OnTextChanged"
                                class="form-control" data-date-format="dd/mm/yyyy" runat="server"  />
                            <span class="input-group-addon"><i class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <asp:GridView ID="PlanificcacionDatos" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:BoundField DataField="Unidad" HeaderText="Unidad" />
                        <asp:BoundField DataField="Conductor" HeaderText="Conductor" />
                        <asp:TemplateField HeaderText="Lunes">
                            <ItemTemplate>
                                <%# Eval("Lun")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Martes">
                            <ItemTemplate>
                                <%# Eval("Mar")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Miercoles">
                            <ItemTemplate>
                                <%# Eval("Mie")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Jueves">
                            <ItemTemplate>
                                <%# Eval("Jue")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Viernes">
                            <ItemTemplate>
                                <%# Eval("Vie")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sabado">
                            <ItemTemplate>
                                <%# Eval("Sab")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Domingo">
                            <ItemTemplate>
                                <%# Eval("Dom")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <!-- ./span -->
                <asp:Repeater ID="ListaPlanificacion" runat="server" OnItemDataBound="ListaPlanificacion_ItemDataBound">
                    <HeaderTemplate>
                        <table class="table table-striped table-bordered table-hover">
                            <tr>
                                <th>
                                    Unidad
                                </th>
                                <th>
                                    Conductor
                                </th>
                                <th>
                                    Mar
                                </th>
                                <th>
                                    Mie
                                </th>
                                <th>
                                    Jue
                                </th>
                                <th>
                                    Vie
                                </th>
                            </tr>
                    </HeaderTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# Eval("Unidad")%>
                            </td>
                            <td>
                                <%# Eval("Conductor")%>
                            </td>
                            <td style="text-align: center">
                                <%# Eval("DiaUno")%>
                            </td>
                            <td style="text-align: center">
                                <%# Eval("DiaDos")%>
                            </td>
                            <td style="text-align: center">
                                <%# Eval("DiaTres")%>
                            </td>
                            <td style="text-align: center">
                                <%# Eval("DiaCuatro")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        jQuery(function ($) {
            $("#<%= FechaInicio.ClientID %>").datepicker({
                showOtherMonths: true,
                selectOtherMonths: false
            });
        });
    </script>
</asp:Content>
