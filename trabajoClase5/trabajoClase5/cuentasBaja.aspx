<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cuentasBaja.aspx.cs" Inherits="trabajoClase5.cuentasBaja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="157px">
            Buscar Cuenta<br />
            Id Cuenta:&nbsp;<br /><asp:TextBox ID="idCuentaTB" runat="server" Width="229px"></asp:TextBox>
            <br />
            <asp:Button ID="buscarBT" runat="server" OnClick="buscarBT_Click" Text="Buscar Cuenta" Width="127px" />
            <br />
            <asp:Label ID="idLB" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="descripcionLB" runat="server" Text="-"></asp:Label>
            <br />
            <asp:Button ID="eliminarBT" runat="server" OnClick="eliminarBT_Click" style="margin-left: 0px" Text="Eliminar Cuenta" Width="127px" />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSourceCuenta" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" DeleteCommand="DELETE FROM Cuentas WHERE (idCuenta = @idCuenta)" InsertCommand="INSERT INTO Cuentas (descripcion) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas] where idCuenta = @idCuenta" UpdateCommand="UPDATE Cuentas SET descripcion = @descripcion WHERE (idCuenta = @idCuenta)">
                <DeleteParameters>
                    <asp:Parameter Name="idCuenta" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="idCuenta" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" />
                    <asp:Parameter Name="idCuenta" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <div>
        </div>
    </form>
</body>
</html>
