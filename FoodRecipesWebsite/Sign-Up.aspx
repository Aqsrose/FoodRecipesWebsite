<%@ Page Title="" Language="C#" MasterPageFile="~/Blankpage.Master" AutoEventWireup="true" CodeBehind="Sign-Up.aspx.cs" Inherits="FoodRecipesWebsite.Sign_Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="UserData" runat="server"></asp:GridView>
      <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignUp - Food Recipes</title>
    <style>
        body{
            margin: 0;
            padding: 0;
            /* background: url(./img/loginImg.jpg); */
            font-family: sans-serif;
        }
        .loginbox{
            width: 400px;
            /* height: 475px; */
            background: white;
            border-radius: 20px;
            box-shadow: 0 0 15px 0 rgb(0 0 0 / 30%);
            color: black;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
            box-sizing: border-box;
            padding: 70px 30px;
            transition: transform .5s;
        }

        .loginbox:hover{
            transform: translate(-50%, -51%);
        }

        h1{
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 22px;
        }

        .loginbox p{
            margin: 0;
            padding: 0;
            font-weight: bold;
        }

        .loginbox input{
            width: 100%;
            margin-bottom: 20px;
        }

        .loginbox input::placeholder{
          color: rgb(161, 161, 161);
        }

        .loginbox input[type = "email"],
        input[type="text"], 
        input[type = "password"]{
            border: none;
            border-bottom: 1px solid brown;
            background: transparent;
            outline: none;
            height: 40px;
            color: black;
            font-size: 14px;
        }

        .btn{
            border: none;
            outline: none;
            height: 40px;
            background-color: #ac4511;
            color: #fff;
            font-size: 18px;
            border-radius: 20px;
            display: block;
            padding-inline: 5em;
            margin-bottom: .4em;
        }

        .btn:hover{
            cursor: pointer;
            background: rgb(143, 67, 29);
        }

        .loginbox a{
            text-decoration: none;
            font-size: 12px;
            line-height: 20px;
            color: darkgray;
        }

        .loginbox a:hover{
            color: black;
        }
        .Message {
            color: Red;
            font-size: 0.8em;
            margin-top: -10px;
        }
    </style>
</head>
<body>
        <div class="loginbox">
            <h1>Sign Up</h1>
            <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            <p>Username</p>
            <asp:TextBox ID="Username" runat="server" type="text" ValidationGroup="SignUp" placeholder="Enter Username" onkeyup="main()"></asp:TextBox>
            <div class="Message">
            <asp:RequiredFieldValidator CssClass="Message" ID="UsernameValidator" runat="server" ControlToValidate="Username" Text="*" ForeColor="Red" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
            </div>
            <p>Email</p>
            <div class="Message">
             <asp:RequiredFieldValidator CssClass="Message" ID="EmailValidator" runat="server" ControlToValidate="Email" Text="*" ForeColor="Red" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
            </div>
            <asp:TextBox ID="Email" runat="server" type="email" placeholder="Enter Email" ValidationGroup="SignUp" onkeyup="main()"></asp:TextBox>
            <div class="Message">
            <asp:RegularExpressionValidator ID="EmailFormatValidator" runat="server" ControlToValidate="Email" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" Text="Invalid email format" ForeColor="Red" ValidationGroup="SignUp"></asp:RegularExpressionValidator>
            </div>
            <p>Password</p>
            <asp:TextBox ID="Password" runat="server" type="password" onkeyup="main()" placeholder="Enter Password" ValidationGroup="SignUp"></asp:TextBox>
            <div class="Message"> 
            <asp:RequiredFieldValidator CssClass="Message" ID="PasswordValidator" runat="server" ControlToValidate="Password" Text="*" ForeColor="Red" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
            </div>
            <p>Confirm Password</p>
            <asp:TextBox ID="cpassword" runat="server" type="password" onkeyup="main()" placeholder="Re-enter Password"></asp:TextBox>
            <div class="Message">
            <asp:RequiredFieldValidator CssClass="Message" ID="ConfirmPasswordValidator" runat="server" ControlToValidate="cpassword" Text="*" ForeColor="Red" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
            <asp:CompareValidator CssClass="Message" ID="PasswordMatchValidator" runat="server" ControlToValidate="cpassword" ControlToCompare="Password" Text="Passwords do not match" ForeColor="Red" ValidationGroup="SignUp"></asp:CompareValidator>            
            </div>
            <asp:FileUpload ID="IMAGE" runat="server" ValidationGroup="SignUp" />
            <div class="Message">
            <asp:RequiredFieldValidator CssClass="Message" ID="ImageValidator" runat="server" ControlToValidate="IMAGE" Text="*"  ForeColor="Red" ValidationGroup="SignUp"></asp:RequiredFieldValidator>
            </div>
            <p>Choose profile image</p>
            <asp:Button ID="submitBtn" runat="server" class="btn" type="submit" Style="width: 100%; margin-top: .3em;" Text="SignUp" OnClick="submitBtn_Click" ValidationGroup="SignUp" />
            <a href="Login.aspx" target="_blank" class="ar">Already have an account?</a>
        </div>
</body>
</html>
</asp:Content>
