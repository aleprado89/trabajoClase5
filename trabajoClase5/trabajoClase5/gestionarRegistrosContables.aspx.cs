using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trabajoClase5
{
    public partial class gestionarRegistrosContables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            actualizarTabla();             
        }

        //Actualizar Tabla
        protected void actualizarTabla()
        {
            registrosTabla.Rows.Clear();
            try
            {
                DataView dv = (DataView)SqlDataSourceRegistrosTabla.Select(DataSourceSelectArguments.Empty);
                
                if (dv != null && dv.Count > 0)
                {
                    //Cabecera
                    TableRow headerRow = new TableRow();

                    TableCell headerCell0 = new TableCell();
                    headerCell0.Text = "Id";
                    headerRow.Cells.Add(headerCell0);

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Descripcion";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Monto";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Tipo";
                    headerRow.Cells.Add(headerCell3);

                    registrosTabla.Rows.Add(headerRow);

                    //Filas
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell0 = new TableCell();
                        cell0.Text = row["idRegistrosContables"].ToString();
                        tableRow.Cells.Add(cell0);

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        if (row["tipo"].Equals(false)) { cell3.Text = "Debe"; }
                        if (row["tipo"].Equals(true)) { cell3.Text = "Haber"; }                        
                        tableRow.Cells.Add(cell3);

                        registrosTabla.Rows.Add(tableRow);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error');", true);
            }
        }

        //Agregar
        protected void agregarBT_Click(object sender, EventArgs e)
        {
            int monto;
            bool montoNumero = Int32.TryParse(montoTB.Text, out monto);
            if (cuentaDDL.Text != "" && montoTB.Text != "" && tipoDDL.Text != "")
            {
                if (montoNumero == true)
                {
                    try
                    {
                        this.SqlDataSourceRegistros.Insert();
                        this.resultadoLB.Text = "Se efectuó la carga.";

                        this.montoTB.Text = "";
                        actualizarTabla();
                    }
                    catch (SqlException)
                    {
                        this.resultadoLB.Text = "Error al realizar la carga.";
                    }
                }
                else
                {
                    this.resultadoLB.Text = "El monto tiene que ser un número entero.";
                }
            }
            else { this.resultadoLB.Text = "Faltan cargar datos."; }
        }
        //Eliminar
        protected void eliminarBT_Click(object sender, EventArgs e)
        {
            try
            {
                this.SqlDataSourceRegistros.Delete();
                this.resultadoLB.Text = "Se elimino el Registro.";

                actualizarTabla();
            }
            catch (SqlException)
            {
                this.resultadoLB.Text = "Error al eliminar.";
            }
        }
        //Modificar
        protected void modificarBT_Click(object sender, EventArgs e)
        {
            try
            {
                this.SqlDataSourceRegistrosModificar.Update();
                this.resultadoLB.Text = "Se modificó el Registro.";

                actualizarTabla();
            }
            catch (SqlException)
            {
                this.resultadoLB.Text = "Error al modificar.";
            }
        }

        //Seleccion Registro
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.SqlDataSourceRegistrosModificar.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceRegistrosModificar.Select(DataSourceSelectArguments.Empty);

            if (registros.Read())
            {     
                cuentaDDL.SelectedValue = registros["idCuenta"].ToString();
                montoTB.Text = registros["monto"].ToString();

                if (registros["tipo"].ToString() == "1")
                {                    
                    tipoDDL.SelectedValue = "1";
                }
                else
                {                    
                    tipoDDL.SelectedValue = "0";
                }                
            }
            else
            {
                this.resultadoLB.Text = "No existe el Registro.";
            }
        }
    }
}