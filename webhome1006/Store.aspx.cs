using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace webhome1006
{
    public partial class Store : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            drinkDetailsView.DataBind();
            userShowLB.Text = Session["name"] + " 歡迎光臨<br>您還剩下: " + Session["money"]+ "元";
            if (!IsPostBack)
            {
                DrinkPriceLB.Text = "";
                DrinkQtLB.Text = "";
                drinkImage.ImageUrl = "./pic/主頁.jpg";
                for(int i = 0; i < 50; i++)
                {
                    cupList.Items.Insert(i, new ListItem("" + (i + 1), "" + (i + 1)));
                }
                cupList.SelectedIndex = 0;
            }
            
        }
        protected void drinkList_SelectedIndexChanged(object sender, EventArgs e)
        {
            drinkImage.ImageUrl = "./pic/" + DrinkList.SelectedItem.ToString() + ".jpg";
            if(0 == DrinkList.SelectedIndex)
            {
                DrinkPriceLB.Text = "";
                DrinkQtLB.Text = "";
                addItemBT.Enabled = false;
            }
            else
            {
                DrinkPriceLB.Text = drinkDetailsView.Rows[0].Cells[1].Text + "元";
                DrinkQtLB.Text = "\t庫存: " + drinkDetailsView.Rows[1].Cells[1].Text +"個";
                addItemBT.Enabled = true;
            }
        }
        protected void orderBT_Click(object sender, EventArgs e)
        {
            drinkDataSelect.Insert();
            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderCmd = new SqlCommand("select top 1 order_id from [orderTable] order by order_id Desc", orderCon);
            SqlDataReader orderDr;
            orderDr = orderCmd.ExecuteReader();
            if (orderDr.Read())
            {
                Session["order_id"] = orderDr["order_id"];
                orderBT.Text = orderDr["order_id"] + " 號訂單 ";
                orderBT.Enabled = false;

                cupLB.Visible = true;
                cupList.Visible = true;
                sweetList.Visible = true;
                iceList.Visible = true;
                addItemBT.Visible = true;
            }
            orderDr.Close();
        }
        protected void truncateTableBT_Click(object sender, EventArgs e)
        {
            drinkDataSelect.Insert();
            SqlConnection orderCon = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            orderCon.Open();
            SqlCommand orderTableTruncateCmd = new SqlCommand("truncate table orderTable", orderCon);
            orderTableTruncateCmd.ExecuteNonQuery();
            SqlCommand orderItemTableTruncateCmd = new SqlCommand("truncate table orderItemTable", orderCon);
            orderItemTableTruncateCmd.ExecuteNonQuery();
            orderBT.Text = "前往訂購";
            orderBT.Enabled = true;

            cupLB.Visible = false;
            cupList.Visible = false;
            sweetList.Visible = false;
            iceList.Visible = false;
            addItemBT.Visible = false;
            orderItemGridView.Visible = false;
            totalLB.Visible = false;
        }
        protected void addItemBT_Click(object sender, EventArgs e)
        {
            orderItemDataSource.Insert();
            if (!orderItemGridView.Visible)
            {
                orderItemGridView.Visible = true;
            }
            totalLB.Visible = true;
        }

        protected void ItemGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //ItemGridView.DataBind();
            countTotal();
        }

        protected void countTotal()
        {
            int total = 0;
            string warmMsg = "";
            for (int i = 0; i < orderItemGridView.Rows.Count; i++)
            {
                if (orderItemGridView.Rows[i].Cells[4].FindControl("subTotalLB")!=null)
                {
                    total += Convert.ToInt32(((Label)orderItemGridView.Rows[i].Cells[4].FindControl("subTotalLB")).Text);
                }
                cupEditCheck(ref warmMsg, i);
            }
            //String opu = "Total Price : " + total + "$";
            //totalLB.Text = opu;
            totalLB.Text = warmMsg + "總價: "+ total +"元";
            
        }
        private void cupEditCheck(ref string msg, int i)
        {
            if (orderItemGridView.Rows[i].Cells[1].FindControl("itemCupLB") != null)
            {
                using (Label tempCupLB = (Label)orderItemGridView.Rows[i].Cells[1].FindControl("itemCupLB"))
                {
                    if (tempCupLB.Text == "0")
                    {
                        msg = "(錯誤的杯數)";
                        tempCupLB.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        tempCupLB.ForeColor = System.Drawing.Color.Black;
                    }
                }
                 
            }
        }
        protected void ItemGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (orderItemGridView.Rows.Count == 1)  // 刪除最後 1 列
            { 
                totalLB.Visible = false;
            }
        }

        protected void editCupTB_TextChanged(object sender, EventArgs e)
        {
            foreach(char ch in ((TextBox)sender).Text)
            {
                if (!Char.IsDigit(ch))
                {
                    ((TextBox)sender).Text = "0";
                }
            }
        }
    }
}