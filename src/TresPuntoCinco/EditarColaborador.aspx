<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditarColaborador.aspx.cs" Inherits="TresPuntoCinco.EditarColaborador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Colaborador</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Colaborador <small><i class="icon-double-angle-right"></i>&nbsp;Editar informaci&oacute;n
                        </small>
                    </h1>
                </div>
                <!--/.page-header-->
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" for="<%= Nombre.ClientID %>">
                            Nombres</label>
                        <div class="controls">
                            <asp:TextBox ID="Nombre" runat="server" placeholder="Nombre"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="<%= Apellidos.ClientID %>">
                            Apellidos</label>
                        <div class="controls">
                            <asp:TextBox ID="Apellidos" runat="server" placeholder="Apellidos"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="<%= Domicilio.ClientID %>">
                            Domicilio</label>
                        <div class="controls">
                            <asp:TextBox ID="Domicilio" runat="server" placeholder="Domicilio" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="<%= Documento.ClientID %>">
                            DNI</label>
                        <div class="controls">
                            <asp:TextBox ID="Documento" runat="server" placeholder="Documento" MaxLength="8"></asp:TextBox>
                        </div>
                    </div>
                    <!--Telefono, NumeroBrevete, TipoBrevete-->
                    <div class="control-group">
                        <label class="control-label" for="<%= Telefono.ClientID %>">
                            Tel&eacute;fono</label>
                        <div class="controls">
                            <asp:TextBox ID="Telefono" runat="server" placeholder="Telefono" MaxLength="8"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="<%= NumeroBrevete.ClientID %>">
                            Numero de Brevete</label>
                        <div class="controls">
                            <asp:TextBox ID="NumeroBrevete" runat="server" placeholder="Numero de brevete" MaxLength="10"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="<%= NumeroBrevete.ClientID %>">
                            Tipo de Brevete</label>
                        <div class="controls">
                            <asp:DropDownList ID="TipoBrevete" CssClass="form-control" runat="server">
                                <asp:ListItem>A-I</asp:ListItem>
                                <asp:ListItem>A-II</asp:ListItem>
                                <asp:ListItem>A-III</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row-fluid">
                    </div>
                    <div class="row-fluid">
                        <div class="col-xs-9 col-sm-6">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h5>
                                        Capacitaciones</h5>
                                    <div class="widget-toolbar">
                                        <a href="#" class="orange2"><i class="icon-file"></i>&nbsp;Nueva </a>
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div class="table-responsive">
                                        <asp:GridView ID="ListaCapacitaciones" runat="server" CssClass="table table-striped table-bordered table-hover"
                                            AutoGenerateColumns="False" DataKeyNames="IdCapacitacion" OnSelectedIndexChanged="ListaCapacitaciones_SelectedIndexChanged">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" />
                                                <asp:BoundField DataField="IdCapacitacion" HeaderText="IdCapacitacion" Visible="False" />
                                                <asp:BoundField DataField="IdColaborador" HeaderText="Colaborador" Visible="False" />
                                                <asp:BoundField DataField="NombreCapacitacion" HeaderText="Capacitacion" />
                                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
                                                <asp:BoundField DataField="Institucion" HeaderText="Institucion" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
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
    <!--/span-->
</asp:Content>
