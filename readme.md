### ✅ **Step 1: Create the virtual environment (first time only)**

In your project folder:

```bash
python -m venv venv
```

This creates a `venv/` folder with its own Python, `pip`, and dependencies folder.

> ✅ Do this **once** per project. After that, you only need to activate it.

---

### ✅ **Step 2: Activate the virtual environment**

Every time you open your terminal in this project:

- **Git Bash / Bash (VS Code)**:

  ```bash
  source venv/Scripts/activate
  ```

- **CMD**:

  ```cmd
  venv\Scripts\activate.bat
  ```

- **PowerShell**:

  ```powershell
  venv\Scripts\Activate.ps1
  ```

You’ll know it’s activated if your prompt shows something like:

```
(venv) user@pc MINGW64 ~/yourproject
```

---

### ✅ **Step 3: Confirm it’s active**

Check with either of these:

- **Method A**:

  ```bash
  echo $VIRTUAL_ENV
  ```

  It should print the path to your virtual environment.

- **Method B**:

  ```bash
  python -c "import sys; print(sys.prefix != getattr(sys, 'base_prefix', sys.prefix))"
  ```

  It should print:

  ```
  True
  ```

---

### ✅ **Step 4: Download the Model**

from the manga ocr model and client private repo and check the releases, there it's where the binary is. paste it into the model folder

---

### ✅ **Step 5: Run the app**

to run the app:

```bash
  python ./app/app.py
```

---

### ✅ **Step 6: Create the docker image**

```bash
  docker build -t manga-ocr-app .
```
