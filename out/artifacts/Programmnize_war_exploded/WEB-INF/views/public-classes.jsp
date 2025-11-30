<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Public Classes</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>

    <style>
        body {
            background: #f5f5f5;
            margin: 0;
            padding-top: 80px; /* tránh đè lên navbar fixed-top */
        }

        .page-title {
            font-size: 28px;
            font-weight: 800;
            color: #0056d6;
            margin-bottom: 16px;
        }

        .class-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .class-header {
            padding: 18px 18px 24px;
            font-size: 32px;
            font-weight: 800;
        }

        .class-header.java { background: #e5f1ff; color: #1a3d91; }
        .class-header.frontend { background: #ffe5e9; color: #c53c50; }
        .class-header.database { background: #efe7ff; color: #4a3ab1; }
        .class-header.python { background: #fff4dd; color: #a06c00; }
        .class-header.scratch { background: #ffeaea; color: #c34a3a; }
        .class-header.devops { background: #fff2d7; color: #a05700; }

        .class-body {
            padding: 14px 18px 18px;
            font-size: 13px;
            flex: 1;
        }

        .class-body p {
            margin-bottom: 4px;
        }

        .meta-line {
            display: flex;
            align-items: center;
            gap: 4px;
            font-size: 12px;
            color: #555;
        }

        .meta-line + .meta-line {
            margin-top: 2px;
        }

        .price-free {
            color: #138c2e;
            font-weight: 700;
            margin-top: 6px;
        }

        .price-paid {
            color: #c53030;
            font-weight: 700;
            margin-top: 6px;
        }

        .card-footer-custom {
            padding: 10px 16px 14px;
        }

        .btn-view {
            width: 100%;
            font-weight: 600;
            border-radius: 8px;
            background: #0056d6;
            border-color: #0056d6;
        }

        .btn-view:hover {
            background: #0043a3;
            border-color: #0043a3;
        }
    </style>
</head>
<body>

<jsp:include page="include/homeBar.jsp"/>

<div class="container mb-4">

    <!-- Title -->
    <h2 class="page-title">Public Classes</h2>

    <!-- Filter row -->
    <div class="row g-2 mb-3">
        <div class="col-md-2 col-6">
            <select class="form-select">
                <option>Category</option>
                <option>Backend</option>
                <option>Frontend</option>
                <option>Database</option>
                <option>AI/ML</option>
            </select>
        </div>
        <div class="col-md-2 col-6">
            <select class="form-select">
                <option>Price</option>
                <option>Free</option>
                <option>Paid</option>
            </select>
        </div>
        <div class="col-md-2 col-6">
            <select class="form-select">
                <option>Sort by</option>
                <option>Newest</option>
                <option>Start date</option>
                <option>Slots left</option>
            </select>
        </div>
        <div class="col-md-6 col-12">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for classes...">
                <button class="btn btn-primary">
                    🔍
                </button>
            </div>
        </div>
    </div>

    <!-- Class cards -->
    <div class="row g-4">

        <!-- Java OOP (card 1, có link sang public-class-details) -->
        <div class="col-md-4">
            <div class="class-card">
                <div class="class-header java">
                    Java OOP
                </div>
                <div class="class-body">
                    <p><strong>Java OOP Basic: Object-Oriented Fundamentals</strong></p>
                    <p>Instructor: Alex Johnson</p>
                    <div class="meta-line">
                        📅 <span>Start Date: 10/12/2025</span>
                    </div>
                    <div class="meta-line">
                        👥 <span>Slots Left: 5/30</span>
                    </div>
                    <div class="price-free">Price: Free</div>
                </div>
                <div class="card-footer-custom">
                    <a href="<%=request.getContextPath()%>/public-class-details"
                       class="btn btn-view btn-primary">
                        View Details
                    </a>
                </div>
            </div>
        </div>

        <!-- Frontend -->
        <div class="col-md-4">
            <div class="class-card">
                <div class="class-header frontend">
                    Frontend
                </div>
                <div class="class-body">
                    <p><strong>Web Front-end Development Bootcamp (HTML/CSS/JS)</strong></p>
                    <p>Instructor: Jane Smith</p>
                    <div class="meta-line">
                        📅 <span>Start Date: 01/01/2026</span>
                    </div>
                    <div class="meta-line">
                        👥 <span>Slots Left: 25/35</span>
                    </div>
                    <div class="price-free">Price: Free</div>
                </div>
                <div class="card-footer-custom">
                    <button class="btn btn-view btn-primary" type="button">
                        View Details
                    </button>
                </div>
            </div>
        </div>

        <!-- Database -->
        <div class="col-md-4">
            <div class="class-card">
                <div class="class-header database">
                    Database
                </div>
                <div class="class-body">
                    <p><strong>Database Design Fundamentals (SQL/NoSQL)</strong></p>
                    <p>Instructor: David Lee</p>
                    <div class="meta-line">
                        📅 <span>Start Date: 15/12/2025</span>
                    </div>
                    <div class="meta-line">
                        👥 <span>Slots Left: Full!</span>
                    </div>
                    <div class="price-paid">Price: $49.99</div>
                </div>
                <div class="card-footer-custom">
                    <button class="btn btn-view btn-primary" type="button">
                        View Details
                    </button>
                </div>
            </div>
        </div>

        <!-- Python -->
        <div class="col-md-4">
            <div class="class-card">
                <div class="class-header python">
                    Python
                </div>
                <div class="class-body">
                    <p><strong>Python for Data Science &amp; Machine Learning</strong></p>
                    <p>Instructor: Emily Chen</p>
                    <div class="meta-line">
                        📅 <span>Start Date: 20/01/2026</span>
                    </div>
                    <div class="meta-line">
                        👥 <span>Slots Left: 18/20</span>
                    </div>
                    <div class="price-paid">Price: $69.99</div>
                </div>
                <div class="card-footer-custom">
                    <button class="btn btn-view btn-primary" type="button">
                        View Details
                    </button>
                </div>
            </div>
        </div>

        <!-- Scratch -->
        <div class="col-md-4">
            <div class="class-card">
                <div class="class-header scratch">
                    Scratch
                </div>
                <div class="class-body">
                    <p><strong>Introduction to Programming with Scratch (Ages 8–12)</strong></p>
                    <p>Instructor: Alex Johnson</p>
                    <div class="meta-line">
                        📅 <span>Start Date: 05/01/2026</span>
                    </div>
                    <div class="meta-line">
                        👥 <span>Slots Left: 10/10</span>
                    </div>
                    <div class="price-free">Price: Free</div>
                </div>
                <div class="card-footer-custom">
                    <button class="btn btn-view btn-primary" type="button">
                        View Details
                    </button>
                </div>
            </div>
        </div>

        <!-- DevOps -->
        <div class="col-md-4">
            <div class="class-card">
                <div class="class-header devops">
                    DevOps
                </div>
                <div class="class-body">
                    <p><strong>Advanced DevOps: CI/CD &amp; Kubernetes</strong></p>
                    <p>Instructor: David Lee</p>
                    <div class="meta-line">
                        📅 <span>Start Date: 01/02/2026</span>
                    </div>
                    <div class="meta-line">
                        👥 <span>Slots Left: 22/25</span>
                    </div>
                    <div class="price-paid">Price: $149.99</div>
                </div>
                <div class="card-footer-custom">
                    <button class="btn btn-view btn-primary" type="button">
                        View Details
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Pagination -->
    <nav aria-label="Public classes pagination" class="mt-4">
        <ul class="pagination justify-content-end">
            <li class="page-item disabled">
                <a class="page-link">Previous</a>
            </li>
            <li class="page-item active">
                <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
