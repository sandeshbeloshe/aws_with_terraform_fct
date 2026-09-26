@@ -0,0 +1,75 @@

-----

### Terraform Data Type: `map` 🗺️

A `map` variable is used to store a collection of **key-value pairs**. This is perfect for when you need to group related values together, where each value is identified by a unique name (the key). The keys must be strings, and all values in the map must be of the same type (e.g., all strings, all numbers).

-----

### 💻 Example: Setting Resource Tags

The most common use case for a `map` is to define a set of resource tags that you want to apply to all your infrastructure.

**1. Define the Variable (`variables.tf`)**

We declare our variable with a `type` of `map(string)`, which means it's a map where all the values are also strings.

```terraform
variable "common_tags" {
  description = "A map of common tags to apply to all resources."
  type        = map(string)
  
  default = {
    "Environment" = "Development"
    "Project"     = "WebApp"
    "ManagedBy"   = "Terraform"
  }
}
```

**2. Use the Variable (`main.tf`)**

In our main configuration, we can pass the entire `map` variable directly to the `tags` argument of a resource.

```terraform
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI
  instance_type = "t2.micro"
  
  tags = var.common_tags # <-- The entire map is assigned here
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  # You can also merge maps
  tags = merge(var.common_tags, {
    "Name" = "Main-VPC" # Adds a specific tag
  })
}
```

**3. (Optional) Override the Value (`terraform.tfvars`)**

To change the tags for a different environment (like "production"), you can override the entire map in your `terraform.tfvars` file.

```hcl
# terraform.tfvars

common_tags = {
  "Environment" = "Production"
  "Project"     = "WebApp-Prod"
  "ManagedBy"   = "Terraform"
  "CostCenter"  = "IT-123"
}
```

-----

### 💡 Common Use Cases for `map`

  * 🏷️ **Resource Tags:** The classic example, as shown above.
  * ⚙️ **Environment Configuration:** Storing environment-specific settings like `"dev_account_id" = "111..."`, `"prod_account_id" = "222..."`.
  * 🖥️ **Mapping AMIs to Regions:** Creating a map where the key is the region and the value is the AMI ID.
  * 🔒 **Security Group Rules:** Defining a map of service names to port numbers (e.g., `"http" = 80`, `"https" = 443`).