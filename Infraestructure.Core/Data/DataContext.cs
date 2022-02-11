﻿using Infraestructure.Entity.Model;
using Infraestructure.Entity.Model.Master;
using Infraestructure.Entity.Library;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using Infraestructure.Entity.Vet;

namespace Infraestructure.Core.Data
{
    public  class DataContext:DbContext
    {
        //esta clase  requiere el nugget entity framewoek

        public DataContext(DbContextOptions<DataContext> dbContextOptions) : base(dbContextOptions)
        {

        }
        public DbSet<UserEntity> UserEntity { get; set; }
        public DbSet<RolEntity> RolEntity { get; set; }
        public DbSet<RolUserEntity> RolUserEntity { get; set; }

        public DbSet<PermissionEntity> PermissionEntity { get; set; }
        public DbSet<RolPermissionEntity> RolPermissionEntity { get; set;}

        public DbSet<TypePermissionEntity> TypePermissionEntity { get; set; }

        public DbSet<StateEntity> StateEntity { get; set; }
        public DbSet<TypeStateEntity> TypeStateEntity { get; set; }

        public DbSet<BooksEntity> BooksEntity { get; set; }
       

       

       

        public DbSet<TypeBookEntity> TypeBookEntity { get; set; }

        public DbSet<UserBookEntity> UserBookEntity { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserEntity>()
                .HasIndex(b => b.Email)
                .IsUnique();//esto es para que el Email sea unico
                
            //la siguiente configuracion es para solucionar el problema de los ID
            modelBuilder.Entity<TypeStateEntity>().Property(t=>t.IdTypeState).ValueGeneratedNever();
            modelBuilder.Entity<TypePermissionEntity>().Property(t => t.IdTypePermission).ValueGeneratedNever();
            modelBuilder.Entity<StateEntity>().Property(t => t.IdState).ValueGeneratedNever();
            modelBuilder.Entity<RolEntity>().Property(t => t.IdRol).ValueGeneratedNever();
            modelBuilder.Entity<PermissionEntity>().Property(t => t.IdPermission).ValueGeneratedNever();
        }
    }
}
