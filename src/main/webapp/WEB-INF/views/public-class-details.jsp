<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Java OOP Basic: Object-Oriented Fundamentals</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>

    <style>
        body {
            background: #f5f5f5;
            margin: 0;
            padding-top: 80px; /* tránh bị đè bởi navbar fixed-top */
        }

        .hero-header {
            background: #0664d3;
            color: #fff;
            padding: 18px 0 22px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .breadcrumb-link {
            font-size: 13px;
            opacity: .9;
        }

        .course-title {
            font-size: 26px;
            font-weight: 800;
            margin-bottom: 4px;
        }

        .course-subtitle {
            font-size: 14px;
            opacity: .95;
        }

        .hero-meta {
            font-size: 13px;
            margin-top: 10px;
        }

        .hero-meta span + span {
            margin-left: 16px;
        }

        .card-section {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
            padding: 18px 20px 20px;
            margin-bottom: 18px;
        }

        .section-title {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .learn-list li {
            margin-bottom: 6px;
        }

        .price-box {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            padding: 18px 20px;
        }

        .price-value {
            font-size: 26px;
            font-weight: 800;
            color: #e53935;
            margin-bottom: 8px;
        }

        .btn-buy {
            width: 100%;
            font-weight: 700;
            margin-bottom: 8px;
            border-radius: 8px;
        }

        .btn-gift {
            width: 100%;
            font-weight: 600;
            border-radius: 8px;
        }

        .includes-list li {
            font-size: 13px;
            margin-bottom: 4px;
        }

        .guarantee-text {
            font-size: 12px;
            color: #666;
            margin-top: 10px;
            text-align: center;
        }

        .video-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.06);
            padding: 22px 0;
            text-align: center;
            margin-bottom: 16px;
        }

        .video-placeholder {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: #e3f0ff;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 8px;
            font-size: 32px;
            color: #0664d3;
        }

        .video-label {
            font-size: 13px;
            color: #555;
        }

        .instructor-avatar {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            margin-right: 12px;
        }

        .accordion-button {
            font-size: 14px;
            font-weight: 600;
        }

        .lesson-row {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
            padding: 4px 0;
        }

        .lesson-row + .lesson-row {
            border-top: 1px dashed #e0e0e0;
        }
    </style>
</head>
<body>

<jsp:include page="include/homeBar.jsp"/>

<!-- HEADER -->
<div class="hero-header">
    <div class="container">
        <div class="breadcrumb-link mb-1">
            <a href="<%=request.getContextPath()%>/public-classes" class="text-white text-decoration-none">
                Classes
            </a>
            <span class="mx-1">›</span>
            <span>Java OOP Fundamentals</span>
        </div>

        <div class="row align-items-center">
            <div class="col-lg-9">
                <div class="course-title">
                    Java OOP Basic: Object-Oriented Fundamentals (Paid Course)
                </div>
                <div class="course-subtitle">
                    Master the four pillars of OOP (Encapsulation, Inheritance, Polymorphism, Abstraction) using Java.
                </div>
                <div class="hero-meta">
                    <span>👨‍🏫 Instructor: <strong>Alex Johnson</strong></span>
                    <span>⏱ Total Duration: <strong>~12 hours</strong></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="container my-4">
    <div class="row g-4">

        <!-- LEFT COLUMN -->
        <div class="col-lg-8">

            <!-- What you will learn -->
            <div class="card-section">
                <div class="section-title">What You Will Learn</div>
                <div class="row">
                    <div class="col-sm-6">
                        <ul class="learn-list list-unstyled mb-0">
                            <li>✔ Design clean and robust OOP structures.</li>
                            <li>✔ Implement Classes, Objects, and Constructors.</li>
                            <li>✔ Understand and apply Inheritance (<code>extends</code>/<code>super</code>).</li>
                            <li>✔ Work with Abstract Classes and Interfaces.</li>
                        </ul>
                    </div>
                    <div class="col-sm-6">
                        <ul class="learn-list list-unstyled mb-0">
                            <li>✔ Implement Polymorphism (overloading/overriding).</li>
                            <li>✔ Utilize Encapsulation with Getters and Setters.</li>
                            <li>✔ Apply OOP principles in small real-world projects.</li>
                            <li>✔ Build a solid foundation for frameworks like Spring.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Course description -->
            <div class="card-section">
                <div class="section-title">Course Description</div>
                <p>
                    This course provides a strong foundation in <strong>Object Oriented Programming (OOP)</strong>
                    using the Java language. You will learn how to apply core principles like
                    <strong>Encapsulation, Inheritance, Polymorphism, and Abstraction</strong> to build
                    powerful, maintainable, and scalable applications.
                </p>
                <p>
                    Designed for <strong>Beginners to Intermediate</strong> learners, this class moves
                    systematically from basic Java syntax to advanced OOP design patterns, preparing you
                    for professional development or further study in Java frameworks such as Spring Boot.
                </p>
            </div>

            <!-- Course content (accordion) -->
            <div class="card-section">
                <div class="section-title">Course Content (Syllabus)</div>

                <div class="accordion" id="courseAccordion">

                    <!-- Module 1 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true"
                                    aria-controls="collapseOne">
                                Module 1: Introduction to Java and OOP (2 Lessons)
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse show"
                             aria-labelledby="headingOne" data-bs-parent="#courseAccordion">
                            <div class="accordion-body">
                                <div class="lesson-row">
                                    <span>1.1 What is Java? Environment Setup</span>
                                    <span>15 min</span>
                                </div>
                                <div class="lesson-row">
                                    <span>1.2 Thinking in Object Oriented (OOP)</span>
                                    <span>20 min</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Module 2 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false"
                                    aria-controls="collapseTwo">
                                Module 2: Classes and Objects (4 Lessons)
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse"
                             aria-labelledby="headingTwo" data-bs-parent="#courseAccordion">
                            <div class="accordion-body">
                                <div class="lesson-row">
                                    <span>2.1 Defining Classes and Fields</span>
                                    <span>18 min</span>
                                </div>
                                <div class="lesson-row">
                                    <span>2.2 Constructors and Overloading</span>
                                    <span>22 min</span>
                                </div>
                                <div class="lesson-row">
                                    <span>2.3 Encapsulation &amp; Access Modifiers</span>
                                    <span>20 min</span>
                                </div>
                                <div class="lesson-row">
                                    <span>2.4 Building Your First OOP Project</span>
                                    <span>25 min</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Module 3 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false"
                                    aria-controls="collapseThree">
                                Module 3: Inheritance and Polymorphism (3 Lessons)
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse"
                             aria-labelledby="headingThree" data-bs-parent="#courseAccordion">
                            <div class="accordion-body">
                                <div class="lesson-row">
                                    <span>3.1 Extending Classes &amp; <code>super</code></span>
                                    <span>24 min</span>
                                </div>
                                <div class="lesson-row">
                                    <span>3.2 Method Overriding &amp; Dynamic Dispatch</span>
                                    <span>26 min</span>
                                </div>
                                <div class="lesson-row">
                                    <span>3.3 Abstract Classes &amp; Interfaces</span>
                                    <span>30 min</span>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Instructor -->
            <div class="card-section">
                <div class="section-title">About the Instructor</div>
                <div class="d-flex align-items-start">
                    <div class="instructor-avatar">
                        AJ
                    </div>
                    <div>
                        <div class="fw-bold">Alex Johnson</div>
                        <div class="text-muted" style="font-size: 13px;">
                            Senior Software Engineer &amp; Java Expert
                        </div>
                        <p class="mt-2 mb-1" style="font-size: 13px;">
                            Alex has 10+ years of experience in enterprise Java development and is passionate
                            about teaching clean code principles. He has mentored over 5,000 students globally.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- RIGHT COLUMN -->
        <div class="col-lg-4">

            <!-- Video preview -->
            <div class="video-card">
                <div class="video-placeholder">
                    ▶
                </div>
                <div class="video-label">
                    Preview this course
                </div>
            </div>

            <!-- Price / actions -->
            <div class="price-box mb-3">
                <div class="price-value">$49.99</div>
                <button class="btn btn-danger btn-buy">
                    Buy Course Now
                </button>
                <button class="btn btn-outline-secondary btn-gift">
                    Gift this Course
                </button>

                <hr class="my-3"/>

                <ul class="includes-list list-unstyled mb-0">
                    <li>✅ 12 hours of On-Demand Video</li>
                    <li>✅ 10 Coding Exercises</li>
                    <li>✅ Certificate of Completion</li>
                    <li>✅ Full Lifetime Access</li>
                    <li>✅ Support via Q&amp;A Forum</li>
                </ul>

                <div class="guarantee-text">
                    30-Day Money-Back Guarantee
                </div>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
