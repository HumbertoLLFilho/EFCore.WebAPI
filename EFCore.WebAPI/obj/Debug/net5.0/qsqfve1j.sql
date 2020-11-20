IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [Email] (
    [Id] int NOT NULL IDENTITY,
    [EmailStr] nvarchar(max) NULL,
    CONSTRAINT [PK_Email] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Cliente] (
    [Id] int NOT NULL IDENTITY,
    [Nome] nvarchar(max) NULL,
    [EmailId] int NOT NULL,
    [DtCadastro] datetime2 NOT NULL,
    CONSTRAINT [PK_Cliente] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Cliente_Email_EmailId] FOREIGN KEY ([EmailId]) REFERENCES [Email] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Empresa] (
    [Id] int NOT NULL IDENTITY,
    [ClienteId] int NOT NULL,
    CONSTRAINT [PK_Empresa] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Empresa_Cliente_ClienteId] FOREIGN KEY ([ClienteId]) REFERENCES [Cliente] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_Cliente_EmailId] ON [Cliente] ([EmailId]);
GO

CREATE INDEX [IX_Empresa_ClienteId] ON [Empresa] ([ClienteId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20201120184024_initial', N'5.0.0');
GO

COMMIT;
GO

