<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrosContablesBaja.aspx.cs" Inherits="trabajoClase5.registrosContablesBaja" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="163px">
            Buscar Registro Contable<br /> Id Registro Contable:<br />&nbsp;<asp:TextBox ID="idRegistroTB" runat="server" Width="229px"></asp:TextBox>
            <br />
            <asp:Button ID="buscarBT" runat="server" OnClick="buscarBT_Click" Text="Buscar Registro" Width="127px" />
            <br />
            <asp:Label ID="idLB" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="Label2" runat="server" Text="-"></asp:Label>
            &nbsp;<asp:Label ID="datosLB" runat="server" Text="-"></asp:Label>
            <br />
            <asp:Button ID="eliminarBT" runat="server" OnClick="eliminarBT_Click" style="margin-left: 0px" Text="Eliminar Registro" Width="127px" />
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <asp:SqlDataSource ID="SqlDataSourceRegistros" runat="server" ConnectionString="Data Source=ALEJANDRO;Initial Catalog=clase5;Integrated Security=True" DeleteCommand="DELETE FROM RegistrosContables WHERE (idRegistrosContables = @idRegistrosContables)" InsertCommand="INSERT INTO Cuentas (descripcion) VALUES (@descripcion)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT Cuentas.descripcion, RegistrosContables.idRegistrosContables, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo FROM Cuentas INNER JOIN RegistrosContables ON Cuentas.idCuenta = RegistrosContables.idCuenta WHERE (RegistrosContables.idRegistrosContables = @idRegistrosContables)" UpdateCommand="UPDATE Cuentas SET descripcion = @descripcion WHERE (idCuenta = @idCuenta)">
                <DeleteParameters>
                    <asp:Parameter Name="idRegistrosContables" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="idRegistrosContables" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" />
                    <asp:Parameter Name="idCuenta" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        </div>
    </form>
</body>
</html>
