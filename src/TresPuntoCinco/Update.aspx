<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="TresPuntoCinco.Update" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right"></i></span></li>
                    <li class="active">Actualzaci&oacute;n</li>
                </ul>
            </div>


            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>Actualizaci&oacute;n <small><i class="icon-double-angle-right"></i>&nbsp;Ejecutar Scripts
                    </small>
                    </h1>
                </div>

                <div class="control-group">
                    <label class="control-label" for="<%= Log.ClientID %>">
                        Log de Eventos</label>
                    <div class="controls">
                        <asp:TextBox ID="Log" runat="server" placeholder="Log" Width="80%" Height="300" Style="width: 80%; height: 300" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="space-4">
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <asp:Button ID="Ejecutar" class="btn btn-danger" runat="server" Text="Ejecutar Actualización" OnClick="Ejecutar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="center">
									<div class="row">
										<div class="col-xs-12">
											<div>
												<span>.col-xs-12</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-1">
											<div>
												<span>.col-xs-1</span>
											</div>
										</div>

										<div class="col-xs-11">
											<div>
												<span>.col-xs-11</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-6 col-sm-2">
											<div>
												<span>.col-xs-6.col-sm-2</span>
											</div>
										</div>

										<div class="col-xs-6 col-sm-10">
											<div>
												<span>.col-xs-6.col-sm-10</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-12 col-lg-6">
											<div>
												<span>.col-xs-12.col-lg-6</span>
											</div>
										</div>

										<div class="col-xs-12 col-lg-6">
											<div>
												<span>.col-xs-12.col-lg-6</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-4">
											<div>
												<span>.col-xs-4</span>
											</div>
										</div>

										<div class="col-xs-8">
											<div>
												<span>.col-xs-8</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-5">
											<div>
												<span>.col-xs-5</span>
											</div>
										</div>

										<div class="col-xs-7">
											<div>
												<span>.col-xs-7</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-6">
											<div>
												<span>.col-xs-6</span>
											</div>
										</div>

										<div class="col-xs-6">
											<div>
												<span>.col-xs-6</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-7">
											<div>
												<span>.col-xs-7</span>
											</div>
										</div>

										<div class="col-xs-5">
											<div>
												<span>.col-xs-5</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-8">
											<div>
												<span>.col-xs-8</span>
											</div>
										</div>

										<div class="col-xs-4">
											<div>
												<span>.col-xs-4</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-9">
											<div>
												<span>.col-xs-9</span>
											</div>
										</div>

										<div class="col-xs-3">
											<div>
												<span>.col-xs-3</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-10">
											<div>
												<span>.col-xs-10</span>
											</div>
										</div>

										<div class="col-xs-2">
											<div>
												<span>.col-xs-2</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-11">
											<div>
												<span>.col-xs-11</span>
											</div>
										</div>

										<div class="col-xs-1">
											<div>
												<span>.col-xs-1</span>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-12">
											<div>
												<span>.col-xs-12</span>
											</div>
										</div>
									</div>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->

</asp:Content>
<asp:Content ID="ScriptsContent" ContentPlaceHolderID="InlineScripts" runat="server">
</asp:Content>
