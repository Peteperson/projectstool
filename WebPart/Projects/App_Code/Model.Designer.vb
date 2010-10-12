﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:2.0.50727.3607
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

<Assembly: Global.System.Data.Objects.DataClasses.EdmSchemaAttribute("df7662d3-d89c-4e13-8962-97266d085741")> 

'Original file name:
'Generation date: 12/10/2010 11:53:33 πμ
Namespace ProjectsModel
    '''<summary>
    '''There are no comments for ProjectsEntities in the schema.
    '''</summary>
    Partial Public Class ProjectsEntities
        Inherits Global.System.Data.Objects.ObjectContext
        '''<summary>
        '''Initializes a new ProjectsEntities object using the connection string found in the 'ProjectsEntities' section of the application configuration file.
        '''</summary>
        Public Sub New()
            MyBase.New("name=ProjectsEntities", "ProjectsEntities")
            Me.OnContextCreated
        End Sub
        '''<summary>
        '''Initialize a new ProjectsEntities object.
        '''</summary>
        Public Sub New(ByVal connectionString As String)
            MyBase.New(connectionString, "ProjectsEntities")
            Me.OnContextCreated
        End Sub
        '''<summary>
        '''Initialize a new ProjectsEntities object.
        '''</summary>
        Public Sub New(ByVal connection As Global.System.Data.EntityClient.EntityConnection)
            MyBase.New(connection, "ProjectsEntities")
            Me.OnContextCreated
        End Sub
        Partial Private Sub OnContextCreated()
        End Sub
        '''<summary>
        '''There are no comments for VariousTypes in the schema.
        '''</summary>
        Public ReadOnly Property VariousTypes() As Global.System.Data.Objects.ObjectQuery(Of VariousTypes)
            Get
                If (Me._VariousTypes Is Nothing) Then
                    Me._VariousTypes = MyBase.CreateQuery(Of VariousTypes)("[VariousTypes]")
                End If
                Return Me._VariousTypes
            End Get
        End Property
        Private _VariousTypes As Global.System.Data.Objects.ObjectQuery(Of VariousTypes)
        '''<summary>
        '''There are no comments for VariousTypes in the schema.
        '''</summary>
        Public Sub AddToVariousTypes(ByVal variousTypes As VariousTypes)
            MyBase.AddObject("VariousTypes", variousTypes)
        End Sub
    End Class
    '''<summary>
    '''There are no comments for ProjectsModel.VariousTypes in the schema.
    '''</summary>
    '''<KeyProperties>
    '''id
    '''</KeyProperties>
    <Global.System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName:="ProjectsModel", Name:="VariousTypes"),  _
     Global.System.Runtime.Serialization.DataContractAttribute(IsReference:=true),  _
     Global.System.Serializable()>  _
    Partial Public Class VariousTypes
        Inherits Global.System.Data.Objects.DataClasses.EntityObject
        '''<summary>
        '''Create a new VariousTypes object.
        '''</summary>
        '''<param name="id">Initial value of id.</param>
        '''<param name="category">Initial value of Category.</param>
        '''<param name="description">Initial value of Description.</param>
        Public Shared Function CreateVariousTypes(ByVal id As Integer, ByVal category As String, ByVal description As String) As VariousTypes
            Dim variousTypes As VariousTypes = New VariousTypes
            variousTypes.id = id
            variousTypes.Category = category
            variousTypes.Description = description
            Return variousTypes
        End Function
        '''<summary>
        '''There are no comments for Property id in the schema.
        '''</summary>
        <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty:=true, IsNullable:=false),  _
         Global.System.Runtime.Serialization.DataMemberAttribute()>  _
        Public Property id() As Integer
            Get
                Return Me._id
            End Get
            Set
                Me.OnidChanging(value)
                Me.ReportPropertyChanging("id")
                Me._id = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value)
                Me.ReportPropertyChanged("id")
                Me.OnidChanged
            End Set
        End Property
        Private _id As Integer
        Partial Private Sub OnidChanging(ByVal value As Integer)
        End Sub
        Partial Private Sub OnidChanged()
        End Sub
        '''<summary>
        '''There are no comments for Property Category in the schema.
        '''</summary>
        <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
         Global.System.Runtime.Serialization.DataMemberAttribute()>  _
        Public Property Category() As String
            Get
                Return Me._Category
            End Get
            Set
                Me.OnCategoryChanging(value)
                Me.ReportPropertyChanging("Category")
                Me._Category = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false)
                Me.ReportPropertyChanged("Category")
                Me.OnCategoryChanged
            End Set
        End Property
        Private _Category As String
        Partial Private Sub OnCategoryChanging(ByVal value As String)
        End Sub
        Partial Private Sub OnCategoryChanged()
        End Sub
        '''<summary>
        '''There are no comments for Property Description in the schema.
        '''</summary>
        <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
         Global.System.Runtime.Serialization.DataMemberAttribute()>  _
        Public Property Description() As String
            Get
                Return Me._Description
            End Get
            Set
                Me.OnDescriptionChanging(value)
                Me.ReportPropertyChanging("Description")
                Me._Description = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false)
                Me.ReportPropertyChanged("Description")
                Me.OnDescriptionChanged
            End Set
        End Property
        Private _Description As String
        Partial Private Sub OnDescriptionChanging(ByVal value As String)
        End Sub
        Partial Private Sub OnDescriptionChanged()
        End Sub
    End Class
End Namespace
