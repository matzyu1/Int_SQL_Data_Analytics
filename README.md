# Intermediate SQL - Sales Analysis

## Overview
Analysis of customer behavior, retention, and lifetime value for an e-commerce company from United Kingdom to improve customer retention and maximize revenue.

## Business Questions
1. **Customer Segmentation:** Who are our most valuable customers?
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Retention Analysis:** Which customers haven't purchased recently?

---

## Analysis Approach

### 1. Customer Segmentation Analysis
- Categorized customers based on total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value segments
- Calculated key metrics: total revenue and average LTV per segment

🖥️ Query: [customer segmentation](1_customer_segmentation.sql)

**📈 Visualization:**

<img src="Resources\1_graph.png" width="600" height="600">

📊 **Key Findings:**
- High-value segment (25% of customers) generates **~79% of total revenue (£7.05M)** with the highest average LTV (£6,499.12)
- Mid-value segment (50% of customers) contributes **~19% of revenue (£1.67M)** with an average LTV of £768.18
- Low-value segment (25% of customers) accounts for **~2% of revenue (£194K)** with a very low average LTV (£179.21)

💡 **Business Insights**
- **High-Value (~79% revenue):** These 1,085 customers are extremely valuable and should be prioritized with VIP treatment, loyalty programs, and retention strategies to protect high revenue impact.
- **Mid-Value (~19% revenue):** The largest customer group presents strong growth potential. Targeted upselling, personalized offers, and engagement campaigns can help move them into the high-value segment.
- **Low-Value (~2% revenue):** These customers contribute minimal revenue. Focus on cost-effective reactivation strategies, discounts, or automated marketing to increase their purchase frequency without overspending.

---

### 2. Cohort Analysis
- Tracked revenue and customer count per cohort
- Cohorts were grouped by year of first purchase
- Measured customer value using revenue per customer

🖥️ Query: [cohort revenue analysis](2_cohort_revenue_analysis.sql)

**📈 Visualization:**

<img src="Resources\2_graph.png" alt="Cohort Analysis" width="600" height="600">

📊 **Key Findings:**
- Customer base grew significantly from **885 customers (2010)** to **3,453 customers (2011)**
- Total revenue increased from **£399K (2010)** to **£1.58M (2011)**, driven primarily by higher acquisition
- Revenue per customer shows a **slight increase**:
  - 2010: £451.27  
  - 2011: £458.60  
- Indicates **stable and slightly improving customer value** alongside rapid growth

💡 **Business Insights**
- **Stable LTV with slight improvement:** Customer value remains consistent, indicating predictable purchasing behavior
- **Growth driven by acquisition:** Revenue growth is largely fueled by acquiring more customers rather than major increases in individual spend
- **Scalability opportunity:** Since LTV is stable, scaling acquisition channels can reliably drive revenue growth
- **Monetization upside:** There is still opportunity to increase revenue per customer through upselling and cross-selling strategies

---

### 3. Customer Retention

- Identified customers as either active or churned based on recent activity
- Analyzed churn behavior across cohort years
- Calculated customer status distribution and retention percentages

🖥️ Query: [retention analysis](3_retention_analysis.sql)

**📈 Visualization:**

<img src="Resources\3_graph.png" alt="Customer Churn by Cohort Year" width="600" height="600">

📊 **Key Findings:**  
- Retention is slightly higher in **2011 (~81%)** compared to **2010 (~78%)**, indicating modest improvement  
- Churn rates remain **relatively consistent but improved slightly**:
  - 2010: ~22% churned  
  - 2011: ~19% churned  
- Majority of customers remain active across both cohorts, suggesting a **stable retention baseline with room for improvement**

💡 **Business Insights:**  
- Improve retention strategies by targeting the ~20% churn rate to strengthen long-term customer value  
- Leverage improvements seen in 2011 to identify effective acquisition or engagement strategies  
- Implement proactive retention efforts (personalized communication, lifecycle emails, loyalty programs)  
- Investigate churn drivers to understand why a consistent portion of customers disengage  

---

## Strategic Recommendations

### 1. Customer Value Optimization (Segmentation Strategy)
- **Prioritize High-Value Customers (~79% revenue)**  
  Launch VIP/loyalty programs with exclusive perks (early access, rewards, premium support)  

- **Upgrade Mid-Value Customers (Growth Lever)**  
  Implement personalized upselling, bundles, and targeted promotions  

- **Optimize Low-Value Segment (Cost Efficiency Focus)**  
  Use automated, low-cost marketing (email flows, retargeting)  


---

### 2. Cohort Performance Strategy (Growth & Monetization)

- **Scale Acquisition Channels**  
  Invest in paid ads, SEO, and influencer partnerships  

- **Increase Revenue per Customer**  
  Introduce bundles, cross-selling, and subscription models  

- **Personalize by Cohort Behavior**  
  Segment users by lifecycle stage (new vs returning)  

---

### 3. Retention & Churn Reduction (Lifecycle Strategy)

- **Strengthen Early Customer Experience**  
  Optimize onboarding, first purchase experience, and follow-ups  

- **Implement Proactive Retention Systems**  
  Trigger campaigns based on inactivity or behavioral signals  

- **Win-Back High-Value Customers**  
  Target churned high-LTV users with personalized incentives  

- **Address Root Causes of Churn**  
  Analyze product, pricing, or UX issues contributing to churn  

---

## Technical Details
- **Database:** PostgreSQL  
- **Analysis Tools:** PostgreSQL, VS Code, PGAdmin  
- **Visualization:** Excel
