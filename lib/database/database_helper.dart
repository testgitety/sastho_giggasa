// lib/database/database_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Import path package

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  // Singleton pattern
  static DatabaseHelper get db => instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the in-memory database
  Future<Database> _initDatabase() async {
    // Open an in-memory database
    // Note: An in-memory database is volatile and will be lost when the app closes
    return await openDatabase(
      inMemoryDatabasePath, // This creates an in-memory database
      version: 1, // Version number
      onCreate: _onCreate, // Function to create tables
    );
  }

  // Create tables when the database is first created
  Future<void> _onCreate(Database db, int version) async {
    // Example: Create a table for storing disease information
    await db.execute('''
      CREATE TABLE Diseases (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category_id TEXT NOT NULL,
        name TEXT NOT NULL,
        description TEXT
      )
    ''');

    // Example: Create a table for storing categories
    await db.execute('''
      CREATE TABLE Categories (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        icon TEXT NOT NULL
      )
    ''');

    // Example: Insert initial categories (you might do this elsewhere or load from a file/json)
    // This is just an example. You might populate this differently based on your needs.
    // await db.insert('Categories', {'id': 'A', 'name': 'সংক্রমণজনিত রোগ', 'icon': '🌼'});
    // await db.insert('Categories', {'id': 'B', 'name': 'খাবর ও পুষ্টির সমস্যা', 'icon': '🍴'});
    // ... Add more categories as needed

    // Example: Insert initial diseases (you might do this elsewhere or load from a file/json)
    // await db.insert('Diseases', {'category_id': 'A', 'name': 'সর্দি-কাশি (Common Cold)', 'description': 'A common viral infection...'});
    // await db.insert('Diseases', {'category_id': 'A', 'name': 'ফ্লু (Fever)', 'description': 'A fever caused by...'});
    // ... Add more diseases as needed
  }

  // --- Example CRUD Operations ---

  // Get all categories
  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await database;
    return await db.query('Categories');
  }

  // Get diseases by category ID
  Future<List<Map<String, dynamic>>> getDiseasesByCategory(String categoryId) async {
    final db = await database;
    return await db.query(
      'Diseases',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );
  }

  // Insert a new category (example)
  Future<void> insertCategory(String id, String name, String icon) async {
    final db = await database;
    await db.insert(
      'Categories',
      {'id': id, 'name': name, 'icon': icon},
      conflictAlgorithm: ConflictAlgorithm.replace, // Replace if exists
    );
  }

  // Insert a new disease (example)
  Future<void> insertDisease(String categoryId, String name, String description) async {
    final db = await database;
    await db.insert(
      'Diseases',
      {'category_id': categoryId, 'name': name, 'description': description},
      conflictAlgorithm: ConflictAlgorithm.replace, // Replace if exists
    );
  }

  // Update a category (example)
  Future<void> updateCategory(String id, String name, String icon) async {
    final db = await database;
    await db.update(
      'Categories',
      {'name': name, 'icon': icon},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete a category (example)
  Future<void> deleteCategory(String id) async {
    final db = await database;
    await db.delete(
      'Categories',
      where: 'id = ?',
      whereArgs: [id],
    );
    // Optionally, also delete related diseases
    await db.delete(
      'Diseases',
      where: 'category_id = ?',
      whereArgs: [id],
    );
  }

// You can add more methods as needed for your specific use cases
}