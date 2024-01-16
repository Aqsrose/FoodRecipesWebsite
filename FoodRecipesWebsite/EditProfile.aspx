<%@ Page Title="" Language="C#" MasterPageFile="~/Blankpage.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="FoodRecipesWebsite.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    
    <style>
       body{
            margin: 0;
            padding: 0;
            /* background: url(./img/loginImg.jpg); */
            font-family: sans-serif;
        }
        .loginbox{
            width: 320px;
            height: 475px;
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

        .loginbox input[type = "text"], input[type = "password"]{
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
            <h2>Edit Profile</h2>
            <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red" Visible="false"></asp:Label>

            <!-- Add FileUpload control for uploading a new profile image -->
            <div>
                <p>Choose profile image</p>
                <asp:FileUpload ID="ProfileImageUpload" runat="server" />
            </div>

            <!-- Add TextBox control for entering a new username -->
            <div>
                 <p>Change Username</p>
                <asp:TextBox ID="NewUsernameTextBox" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div class="btndiv"></div>
            <asp:Button ID="UpdateProfileButton" runat="server" Text="Update Profile" class="btn" OnClick="UpdateProfileButton_Click" />
        </div>
  
</body>
</html>
</asp:Content>
