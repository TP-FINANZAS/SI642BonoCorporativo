
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/22/2022 12:16:16
-- Generated from EDMX file: D:\Developer\Projects\AngularCLI\dev\SI642-TF_BonoCorporativo\SI642_BonoCorporativo\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SI642];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Transaction_CoinType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK_Transaction_CoinType];
GO
IF OBJECT_ID(N'[dbo].[FK_Transaction_Method]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK_Transaction_Method];
GO
IF OBJECT_ID(N'[dbo].[FK_Transaction_PaymentFrequency]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK_Transaction_PaymentFrequency];
GO
IF OBJECT_ID(N'[dbo].[FK_Transaction_RateType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK_Transaction_RateType];
GO
IF OBJECT_ID(N'[dbo].[FK_TransactionHistory_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transaction] DROP CONSTRAINT [FK_TransactionHistory_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CoinType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CoinType];
GO
IF OBJECT_ID(N'[dbo].[Method]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Method];
GO
IF OBJECT_ID(N'[dbo].[PaymentFrequency]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentFrequency];
GO
IF OBJECT_ID(N'[dbo].[RateType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RateType];
GO
IF OBJECT_ID(N'[dbo].[Transaction]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transaction];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CoinType'
CREATE TABLE [dbo].[CoinType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Method'
CREATE TABLE [dbo].[Method] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'PaymentFrequency'
CREATE TABLE [dbo].[PaymentFrequency] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'RateType'
CREATE TABLE [dbo].[RateType] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Transaction'
CREATE TABLE [dbo].[Transaction] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FaceValue] decimal(10,2)  NOT NULL,
    [CommercialValue] decimal(10,2)  NOT NULL,
    [CoinType_Id] int  NOT NULL,
    [DateIssue] datetime  NOT NULL,
    [Years] int  NOT NULL,
    [PaymentFrequency_Id] int  NOT NULL,
    [Method_Id] int  NOT NULL,
    [RateType_Id] int  NOT NULL,
    [InterestRate] decimal(10,5)  NOT NULL,
    [TCEAIssuer] decimal(10,5)  NOT NULL,
    [TREAInvestor] decimal(10,5)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [FatherLastName] nvarchar(50)  NOT NULL,
    [MotherLastName] nvarchar(50)  NOT NULL,
    [DNI] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'CoinType'
ALTER TABLE [dbo].[CoinType]
ADD CONSTRAINT [PK_CoinType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Method'
ALTER TABLE [dbo].[Method]
ADD CONSTRAINT [PK_Method]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentFrequency'
ALTER TABLE [dbo].[PaymentFrequency]
ADD CONSTRAINT [PK_PaymentFrequency]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RateType'
ALTER TABLE [dbo].[RateType]
ADD CONSTRAINT [PK_RateType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [PK_Transaction]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CoinType_Id] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [FK_Transaction_CoinType]
    FOREIGN KEY ([CoinType_Id])
    REFERENCES [dbo].[CoinType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Transaction_CoinType'
CREATE INDEX [IX_FK_Transaction_CoinType]
ON [dbo].[Transaction]
    ([CoinType_Id]);
GO

-- Creating foreign key on [Method_Id] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [FK_Transaction_Method]
    FOREIGN KEY ([Method_Id])
    REFERENCES [dbo].[Method]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Transaction_Method'
CREATE INDEX [IX_FK_Transaction_Method]
ON [dbo].[Transaction]
    ([Method_Id]);
GO

-- Creating foreign key on [PaymentFrequency_Id] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [FK_Transaction_PaymentFrequency]
    FOREIGN KEY ([PaymentFrequency_Id])
    REFERENCES [dbo].[PaymentFrequency]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Transaction_PaymentFrequency'
CREATE INDEX [IX_FK_Transaction_PaymentFrequency]
ON [dbo].[Transaction]
    ([PaymentFrequency_Id]);
GO

-- Creating foreign key on [RateType_Id] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [FK_Transaction_RateType]
    FOREIGN KEY ([RateType_Id])
    REFERENCES [dbo].[RateType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Transaction_RateType'
CREATE INDEX [IX_FK_Transaction_RateType]
ON [dbo].[Transaction]
    ([RateType_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Transaction'
ALTER TABLE [dbo].[Transaction]
ADD CONSTRAINT [FK_TransactionHistory_User]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[User]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransactionHistory_User'
CREATE INDEX [IX_FK_TransactionHistory_User]
ON [dbo].[Transaction]
    ([User_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------