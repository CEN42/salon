namespace Manager.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class newtable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.StylistProfileInfoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        FirstName = c.String(),
                        LastName = c.String(),
                        Email = c.String(),
                        PhoneNumber = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.AspNetUsers", "StylistUsers_Id", c => c.Int());
            CreateIndex("dbo.AspNetUsers", "StylistUsers_Id");
            AddForeignKey("dbo.AspNetUsers", "StylistUsers_Id", "dbo.StylistProfileInfoes", "Id");
            DropColumn("dbo.AspNetUsers", "FirstName");
            DropColumn("dbo.AspNetUsers", "LastName");
        }
        
        public override void Down()
        {
            AddColumn("dbo.AspNetUsers", "LastName", c => c.String());
            AddColumn("dbo.AspNetUsers", "FirstName", c => c.String());
            DropForeignKey("dbo.AspNetUsers", "StylistUsers_Id", "dbo.StylistProfileInfoes");
            DropIndex("dbo.AspNetUsers", new[] { "StylistUsers_Id" });
            DropColumn("dbo.AspNetUsers", "StylistUsers_Id");
            DropTable("dbo.StylistProfileInfoes");
        }
    }
}
