<%@ Page Title="" Language="C#" MasterPageFile="~/Blankpage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="FoodRecipesWebsite.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ChangePassword - Food Recipes</title>
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
        <h1>Reset Password</h1>
        <asp:Label ID="StatusLabel" runat="server" CssClass="statusLabel" EnableViewState="false"></asp:Label>
        <p>Password</p>
        <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password" placeholder="New Password" />
        <div class="Message">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="NewPasswordTextBox"
                Display="Dynamic"
                ErrorMessage="Please enter a new password."
                CssClass="validationMessage" />
        </div>

        <p>Confirm Password</p>
        <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" TextMode="Password" CssClass="inputField" placeholder="Confirm Password" />
        <div class="Message">
            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToCompare="NewPasswordTextBox"
                ControlToValidate="ConfirmPasswordTextBox"
                Display="Dynamic"
                ErrorMessage="Passwords do not match."
                CssClass="validationMessage" />
        </div>
        <asp:Button ID="submitBtn" runat="server" class="btn" type="submit" Style="width: 100%; margin-top: .3em;" Text="SignUp" OnClick="submitBtn_Click" ValidationGroup="SignUp" />

    </div>
</body>
</html>
</asp:Content>
