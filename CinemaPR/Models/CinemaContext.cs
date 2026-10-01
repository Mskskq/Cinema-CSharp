using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace CinemaPR.Models;

public partial class CinemaContext : DbContext
{
    public CinemaContext()
    {
    }

    public CinemaContext(DbContextOptions<CinemaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Film> Films { get; set; }

    public virtual DbSet<GanreInFilm> GanreInFilms { get; set; }

    public virtual DbSet<Genre> Genres { get; set; }

    public virtual DbSet<Hall> Halls { get; set; }

    public virtual DbSet<Sean> Seans { get; set; }

    public virtual DbSet<Ticket> Tickets { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=Cinema;Username=postgres;Password=phttsql");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Film>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Film_pkey");

            entity.ToTable("Film");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Names).HasMaxLength(100);
        });

        modelBuilder.Entity<GanreInFilm>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Ganre_in_Film_pkey");

            entity.ToTable("Ganre_in_Film");

            entity.Property(e => e.FilmFk).HasColumnName("Film_FK");
            entity.Property(e => e.GenreFk).HasColumnName("Genre_FK");

            entity.HasOne(d => d.FilmFkNavigation).WithMany(p => p.GanreInFilms)
                .HasForeignKey(d => d.FilmFk)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Filmmm");

            entity.HasOne(d => d.GenreFkNavigation).WithMany(p => p.GanreInFilms)
                .HasForeignKey(d => d.GenreFk)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Ganre");
        });

        modelBuilder.Entity<Genre>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Genre_pkey");

            entity.ToTable("Genre");

            entity.Property(e => e.Name).HasMaxLength(100);
        });

        modelBuilder.Entity<Hall>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Hall_pkey");

            entity.ToTable("Hall");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CountSeat).HasColumnName("Count_Seat");
        });

        modelBuilder.Entity<Sean>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Seans_pkey");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DateTime)
                .HasColumnType("time with time zone")
                .HasColumnName("Date_Time");
            entity.Property(e => e.FkFilm).HasColumnName("FK_Film");
            entity.Property(e => e.HallFk).HasColumnName("Hall_FK");
            entity.Property(e => e.Price).HasPrecision(10, 2);

            entity.HasOne(d => d.FkFilmNavigation).WithMany(p => p.Seans)
                .HasForeignKey(d => d.FkFilm)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Fk_Film");

            entity.HasOne(d => d.HallFkNavigation).WithMany(p => p.Seans)
                .HasForeignKey(d => d.HallFk)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Hall_FK");
        });

        modelBuilder.Entity<Ticket>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("Tickets_pkey");

            entity.Property(e => e.NumberSeatFk).HasColumnName("Number_Seat_FK");
            entity.Property(e => e.SeansFk).HasColumnName("Seans_FK");

            entity.HasOne(d => d.SeansFkNavigation).WithMany(p => p.Tickets)
                .HasForeignKey(d => d.SeansFk)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Fk_Seans");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
