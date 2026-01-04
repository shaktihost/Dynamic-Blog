using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class user_controls_sendquery : System.Web.UI.UserControl
{
     string proname;
     protected void Page_Load(object sender, EventArgs e)
     {

         btnSubmit.Attributes.Add("onclick", "return ValidateEnquery()");

         //if (Request.QueryString != null && Request.QueryString.Count > 0)
         //{
         //    proname = Convert.ToString(Request.QueryString["pname"]);

         //}
     }
     public void Clear()
     {
         txtfullname.Text = "";
         txtcompanynames.Text = "";

         txtEmailid.Text = "";
         txtContactNo.Text = "";
         txtMessage.Text = "";
     }

     protected void btnClear_Click(object sender, EventArgs e)
     {

         Clear();
     }

     protected void btnSubmit_Click(object sender, EventArgs e)
     {
         string asn = "";
         asn = Convert.ToString(txtcode.Text.Trim());
         if (asn == "a" || asn == "A")
         {
             try
             {
                 StringBuilder sb = new StringBuilder();
                 sb.Append("<table bgcolor='#f9f9f9' width='620px' cellspacing='0' cellpadding='0' border='0' align='center'>");
                 sb.Append("<tbody>");
                 sb.Append("<tr>");
                 sb.Append("<td>");
                 sb.Append("<table width='100%' height='51px' cellspacing='0' cellpadding='0' border='0'>");
                 sb.Append("<tbody>");
                 sb.Append("<tr>");
                 sb.Append("<td width='33%' style='min-height: 51px; padding: 0px 15px'>");
                 sb.Append("<a target='_blank' style='color: #b13d5f; text-decoration: none' href='http://www.aaakhabar.com/'>");
                 sb.Append("<img border='0' alt='' style='width:200px;height:80px;' src='http://www.aaakhabar.com/images/pharm-logo.png'></a>");
                 sb.Append("</td>");
                 sb.Append("<td width='21%' height='51'>&nbsp;");

                 sb.Append("</td>");
                 sb.Append("<td width='46%' height='51'>&nbsp;");

                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("</tbody>");
                 sb.Append("</table>");
                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("<tr>");
                 sb.Append("<td height='4' bgcolor='#FFFFFF' background=''");
                 sb.Append("style='font-size: 1px; min-height: 14px'>");
                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("<tr>");
                 sb.Append("<td style='color: #666; font-size: 13px; font-family: Arial,Helvetica,sans-serif;padding: 5px 25px; line-height: 22px;'>");
                 sb.Append("This is an Automated Reply.");
                 sb.Append("<br />");
                 sb.Append("<br />");


                 sb.Append("<table cellpadding='0' cellspacing='0' width='100%'>");

                 sb.Append("<tr>");
                 sb.Append("<td style='width: 15%' align='left'>");
                 sb.Append("<span style='color: #0C5E94;text-decoration: none;'>Full Name :</span>");
                 sb.Append("</td>");
                 sb.Append("<td style='width: 85%' align='left'>" + txtfullname.Text);
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("<tr>");
                 sb.Append("<td colspan='2' style='height: 5px'>");
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("<tr>");
                 sb.Append("<td style='width: 15%' align='left'>");
                 sb.Append("<span style='color: #0C5E94;text-decoration: none;'>Company :</span>");
                 sb.Append("</td>");
                 sb.Append("<td style='width: 85%' align='left'>" + txtcompanynames.Text);
                 sb.Append("</td>");
                 sb.Append("</tr>");


                 sb.Append("<tr>");
                 sb.Append("<td colspan='2' style='height: 5px'>");
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("<tr>");
                 sb.Append("<td style='width: 15%' align='left'>");
                 sb.Append("<span style='color: #0C5E94;text-decoration: none;'>Email ID :</span>");
                 sb.Append("</td>");
                 sb.Append("<td style='width: 85%' align='left'>" + txtEmailid.Text);
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("<tr>");
                 sb.Append("<td colspan='2' style='height: 5px'>");
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("<tr>");
                 sb.Append("<td style='width: 15%' align='left'>");
                 sb.Append("<span style='color: #0C5E94;text-decoration: none;'>Phone No. :</span>");
                 sb.Append("</td>");
                 sb.Append("<td style='width: 85%' align='left'>" + txtContactNo.Text);
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("<tr>");
                 sb.Append("<td style='width: 15%' align='left'>");
                 sb.Append("<span style='color: #0C5E94;text-decoration: none;'>Message :</span>");
                 sb.Append("</td>");
                 sb.Append("<td style='width: 85%' align='left'>" + txtMessage.Text);
                 sb.Append("</td>");
                 sb.Append("</tr>");



                 sb.Append("<tr>");
                 sb.Append("<td colspan='2' style='height: 5px'>");
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("<tr>");
                 sb.Append("<td style='width: 15%' align='left'>");
                 sb.Append("<span style='color: #0C5E94;text-decoration: none;'>Website :</span>");
                 sb.Append("</td>");
                 sb.Append("<td style='width: 85%' align='left'>");
                 sb.Append("<a style='color: #0C5E94;text-decoration: none;' href='http://www.aaakhabar.com/'>www.aaakhabar.com</a>");
                 sb.Append("</td>");
                 sb.Append("</tr>");

                 sb.Append("</table>");

                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("<tr>");
                 sb.Append("<td height='14' bgcolor='#FFFFFF' background=''");
                 sb.Append("style='font-size: 1px; min-height: 14px'>");
                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("<tr>");
                 sb.Append("<td>");
                 sb.Append("<table width='100%' cellspacing='0' cellpadding='0' border='0'>");
                 sb.Append("<tbody>");
                 sb.Append("<tr>");
                 sb.Append("<td height='6' style='font-size: 1px' colspan='2'>&nbsp;");

                 sb.Append("</td>");
                 sb.Append("</tr>");


                 sb.Append("<tr>");
                 sb.Append("<td style='min-height: 10px' colspan='6'>");
                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("</tbody>");
                 sb.Append("</table>");
                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("</tbody>");
                 sb.Append("</table>");
                 sb.Append("</td>");
                 sb.Append("</tr>");
                 sb.Append("</tbody>");
                 sb.Append("</table>");

                 //MailMessage mail = new MailMessage();
                 //mail.To.Add("pd365helpline@gmail.com");
                 //mail.From = new MailAddress("pd365helpline@gmail.com");
                 //mail.Subject = "Website New Enquiry Details";
                 //mail.Body = Convert.ToString(sb);
                 //mail.IsBodyHtml = true;

                 //SmtpClient smtp = new SmtpClient();
                 //smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                 //smtp.Port = 587;
                 ////smtp.Port = 465;
                 //smtp.Credentials = new System.Net.NetworkCredential
                 //     ("pd365helpline@gmail.com", "sbgpfuibyzmipocy");
                 //// Or your Smtp Email ID and Password
                 //smtp.EnableSsl = true;
                 //smtp.Send(mail);

                 MailMessage mail = new MailMessage();
                 mail.To.Add("ashwanik616@gmail.com");
                 mail.From = new MailAddress("ashwanik616@gmail.com");
                 mail.Subject = "Website New Enquiry Details";
                 mail.Body = Convert.ToString(sb);
                 mail.IsBodyHtml = true;

                 SmtpClient smtp = new SmtpClient();
                 smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                 smtp.Port = 587;
                 //smtp.Port = 465;
                 smtp.Credentials = new System.Net.NetworkCredential
                      ("ashwanik616@gmail.com", "mhdi jsya xpmr xsyc");
                 // Or your Smtp Email ID and Password
                 smtp.EnableSsl = true;
                 smtp.Send(mail);
                 //clearData();
                 Response.Write("<script>alert('Thank You For Enquiry at Aaakhabar.com...');window.location='http://www.aaakhabar.com';</script>");

             }
             catch (Exception ex)
             {
                 Response.Write(ex.Message);

                 //    Response.Write("<script>alert('Can Not Send Mail Try Again Latter...');window.location='contactus.aspx';</script>");
             }
         }
         else
         {
             lblmemessage.Text = "Invalid Answer...!";
         }
     }
}