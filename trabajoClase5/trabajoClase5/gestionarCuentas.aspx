<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionarCuentas.aspx.cs" Inherits="trabajoClase5.gestionarCuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="444px" Wrap="False">
            Cuentas<br />
            <asp:TextBox ID="descripcionAgregarTB" runat="server" Height="18px" MaxLength="50" Width="291px"></asp:TextBox>
            <asp:Button ID="agregarBT" runat="server" OnClick="agregarBT_Click" Text="Agregar Cuenta" Width="300px" />
            <br />
            <br />
            <asp:Label ID="tablaLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:ListBox ID="seleccionLB" runat="server" DataSourceID="SqlDataSourceCuentas" DataTextField="descripcion" DataValueField="idCuenta" Width="297px" OnSelectedIndexChanged="seleccionLB_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
            <br />
            <br />
            <asp:TextBox ID="descripcionModificarTB" runat="server" Width="288px"></asp:TextBox>
            <br />
            <asp:Button ID="eliminarBT" runat="server" Text="Eliminar" Width="138px" OnClick="eliminarBT_Click" />
            <asp:Button ID="modificarBT" runat="server" Text="Modificar" Width="156px" OnClick="modificarBT_Click" />
            <br />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" DeleteCommand="DELETE FROM Cuentas WHERE (idCuenta = @idCuenta)" InsertCommand="INSERT INTO Cuentas (descripcion) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE Cuentas SET descripcion = @descripcion WHERE (idCuenta = @idCuenta)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="seleccionLB" Name="idCuenta" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="descripcionAgregarTB" Name="descripcion" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="descripcionModificarTB" Name="descripcion" PropertyName="Text" />
                    <asp:ControlParameter ControlID="seleccionLB" Name="idCuenta" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCuentasModificar" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" SelectCommand="SELECT idCuenta, descripcion FROM Cuentas WHERE (idCuenta = @idCuenta)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="seleccionLB" Name="idCuenta" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
